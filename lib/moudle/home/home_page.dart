import 'package:flutter/material.dart';
import 'package:wan_android/moudle/article/page/article_page.dart';

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
//    SystemChrome.setSystemUIOverlayStyle(
//        SystemUiOverlayStyle.light.copyWith(statusBarColor: Color(0xAA00BFA6)));
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.android), title: Text('文章')),
          BottomNavigationBarItem(
              icon: Icon(Icons.android), title: Text('公众号')),
          BottomNavigationBarItem(icon: Icon(Icons.android), title: Text('体系')),
          BottomNavigationBarItem(icon: Icon(Icons.android), title: Text('项目'))
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(size: 28),
        selectedLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: SizedBox.expand(
        child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: [
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
            ]),
      ),
    );
  }
}
