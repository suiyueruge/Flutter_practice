import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:myapp/HomePage.dart';
import 'package:myapp/GOT2019.dart';
import 'package:myapp/InstagramPage.dart';
import 'package:myapp/QuizPage.dart';
import 'package:myapp/CocktailPage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int clickIndex = 0;
  List _pageList = [TabOne(), TabTwo(), TabThree(), TabFour(), TabFive()];

  final List<BottomNavigationBarItem> _bottomTabs = [
    BottomNavigationBarItem(
        icon: new Icon(Icons.home_rounded),
        activeIcon: new Icon(Icons.home_sharp),
        label: 'HOME'),
    BottomNavigationBarItem(
        icon: new Icon(Icons.block),
        activeIcon: new Icon(Icons.block),
        label: 'GOT'),
    BottomNavigationBarItem(
        icon: new Icon(Icons.cached),
        activeIcon: new Icon(Icons.cached),
        label: 'INS'),
    BottomNavigationBarItem(
        icon: new Icon(Icons.favorite),
        activeIcon: new Icon(Icons.favorite),
        label: 'QUIZ'),
    BottomNavigationBarItem(
        icon: new Icon(Icons.account_box),
        activeIcon: new Icon(Icons.account_box),
        label: 'COCK')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _pageList[clickIndex],
        bottomNavigationBar: BottomNavigationBar(
          //点击条目的监听回调
          onTap: (int index) {
            setState(() {
              clickIndex = index;
            });
          },
          currentIndex: clickIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: _bottomTabs,
          fixedColor: Colors.black,
        ),
      ),
      theme: ThemeData(
        // fontFamily: "Pacifico",
        primarySwatch: Colors.blue,
        accentColor: Colors.black,
      ),
    );
  }
}

class TabOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookAudioVideoPage();
  }
}

class TabTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Got2019Page();
  }
}

class TabThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InstagramePage();
  }
}

class TabFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return QuizPage();
  }
}

class TabFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CocktailPage();
  }
}
