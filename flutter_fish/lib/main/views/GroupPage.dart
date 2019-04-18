import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fish/common/styles/AppColor.dart';
import 'package:flutter_fish/group/MyFollowedPage.dart';
import 'package:flutter_fish/group/RecommendGroupPage.dart';

class GroupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GroupState();
}

class GroupState extends State<GroupPage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin  {

  TabController tabBarController;
  var tabBar;
  var tabBarView;

  @override
  void initState() {
    super.initState();
    tabBarController = new TabController(vsync: this, length: 2);
    tabBar = new TabBar(
        isScrollable: true,
        indicatorColor: AppColor.orange,
        indicatorWeight: 2.0,
        labelColor: AppColor.orange,
        unselectedLabelColor: AppColor.gray,
        controller: tabBarController,
        tabs: [new Tab(text: "我加入的"),new Tab(text: "推荐")]
    );
    tabBarView = new TabBarView(
        controller: tabBarController,
        children: [MyFollowedPage(), RecommendGroupPage()]
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[Container(
          child: new Padding(
            padding: new EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: tabBar,
          )
      ),
      Expanded(
          child: tabBarView
      )],
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabBarController.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
