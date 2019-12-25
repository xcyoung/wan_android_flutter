import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wan_android/moudle/article/page/article_page.dart';
import 'package:wan_android/generated/i18n.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  PageController _pageController;
  final _pages = [
    ArticlePage(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.yellow,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          _pageController.jumpToPage(index);
        }),
        items: [
          BottomNavyBarItem(
              icon: Icon(
                FontAwesomeIcons.home,
                size: 20.0,
              ),
              title: Text(S.of(context).wan_home_tab_title_home),
              activeColor: Colors.lightBlue,
              inactiveColor: Colors.black45),
          BottomNavyBarItem(
              icon: Icon(
                FontAwesomeIcons.bookOpen,
                size: 20.0,
              ),
              title: Text('体系'),
              activeColor: Colors.lightBlue,
              inactiveColor: Colors.black45),
          BottomNavyBarItem(
              icon: Icon(FontAwesomeIcons.weixin),
              title: Text('公众号'),
              activeColor: Colors.lightBlue,
              inactiveColor: Colors.black45),
          BottomNavyBarItem(
              icon: Icon(
                FontAwesomeIcons.projectDiagram,
                size: 20.0,
              ),
              title: Text('项目'),
              activeColor: Colors.lightBlue,
              inactiveColor: Colors.black45),
          BottomNavyBarItem(
              icon: Icon(
                FontAwesomeIcons.solidUser,
                size: 20.0,
              ),
              title: Text('我的'),
              activeColor: Colors.lightBlue,
              inactiveColor: Colors.black45),
        ],
      ),
      body: SizedBox.expand(
        child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: _pages),
      ),
    );
  }
}
