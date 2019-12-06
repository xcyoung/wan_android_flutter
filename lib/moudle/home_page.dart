import 'package:flutter/material.dart';
import 'package:wan_android/bean/article/article_model.dart';
import 'package:wan_android/model/article_repository.dart';
import 'package:wan_android/http/http_result_observable.dart';
import 'package:wan_android/moudle/home_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ArticleBean> _articles = List<ArticleBean>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WanHttpResultObservable<ArticleList>(articleRepository.getArticleList(0))
        .watch((event) {
      setState(() {
        _articles.addAll(event.data.datas);
      });
    }, (code, message) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        centerTitle: true,
      ),
      body:
          ListView.builder(itemCount: _articles.length, itemBuilder: itemView),
    );
  }

  Widget itemView(BuildContext context, int index) {
    return HomeItem(_articles[index]);
  }
}
