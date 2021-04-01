import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

import 'package:myapp/doubanmovie/tab_bar_widget.dart';
// import 'package:myapp/widgets/my_tab_bar_widget.dart';
import 'package:myapp/doubanmovie/search_text_field_widget.dart';
import 'package:myapp/doubanmovie/search_page.dart';
// import 'package:myapp/router.dart';

var titleList = ['电影', '电视', '综艺', '读书', '音乐', '同城'];

List<Widget> tabList;

TabController _tabController;

///书影音
///包含了'电影', '电视', '综艺', '读书', '音乐', '同城' item Widget

class BookAudioVideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BookAudioVideoPageState();
  }
}

class _BookAudioVideoPageState extends State<BookAudioVideoPage>
    with SingleTickerProviderStateMixin {
  var tabBar;

  @override
  void initState() {
    super.initState();
    tabBar = HomePageTabBar();
    tabList = getTabList();
  }

  List<Widget> getTabList() {
    return titleList
        .map((item) => Text(
              '$item',
              style: TextStyle(fontSize: 15),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: DefaultTabController(
              length: titleList.length, child: _getNestedScrollView(tabBar))),
    );
  }
}

class HomePageTabBar extends StatefulWidget {
  HomePageTabBar({Key key}) : super(key: key);

  @override
  State<HomePageTabBar> createState() {
    return _HomePageTabBarState();
  }
}

class _HomePageTabBarState extends State<HomePageTabBar> {
  Color selectColor, unselectColor;
  TextStyle selectStyle, unselectStyle;

  @override
  void initState() {
    super.initState();
    selectColor = Colors.black;
    unselectColor = Color.fromARGB(255, 117, 117, 117);
    selectStyle = TextStyle(fontSize: 18, color: selectColor);
    unselectStyle = TextStyle(fontSize: 18, color: selectColor);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: TabBar(
        tabs: tabList,
        isScrollable: true,
        controller: _tabController,
        indicatorColor: selectColor,
        labelColor: selectColor,
        labelStyle: selectStyle,
        unselectedLabelColor: unselectColor,
        unselectedLabelStyle: unselectStyle,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }
}

Widget _getNestedScrollView(Widget tabbar) {
  String hintText = '用一部电影来形容你的2018';
  return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10.0),
              child: SearchTextFieldWidget(
                hintText: hintText,
                onTab: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: _SliverAppBarDelegate(
                  child: Container(
                color: Colors.white,
                child: tabbar,
              )))
        ];
      },
      body: FlutterTabBarView(tabController: _tabController));
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.child,
  });

  final double minHeight = 49.0;
  final double maxHeight = 49.0;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
