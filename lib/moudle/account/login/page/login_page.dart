import 'package:wan_android/moudle/account/account_presenter.dart';
import 'package:wan_android/moudle/article/page/article_page.dart';
import 'package:wan_android/mvp/mvp_export.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends BaseState<LoginPage, AccountPresenter> {
  final _accountTextEditingController = new TextEditingController();
  final _pwdTextEditingController = new TextEditingController();
  var _isShowClear = false;
  var _isShowPwd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('登录'),
          centerTitle: true,
        ),
        body: new ListView(children: <Widget>[
          new Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: new TextField(
                  controller: _accountTextEditingController,
                  autocorrect: true,
                  decoration: InputDecoration(
                      labelText: '用户名',
                      hintText: '请输入用户名',
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(
                          color: Color(0xFF999999),
                          width: 0.6
                      )),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(
                          color: Color(0xFF333333),
                          width: 0.6
                      )),
                      suffixIcon: (_isShowClear)
                          ? IconButton(
                              iconSize: 16.0,
                              icon: Icon(Icons.close),
                              onPressed: () {
                                _accountTextEditingController.clear();
                              },
                            )
                          : null),
                  onChanged: (text) {
                    if (_isShowClear && text.length <= 0) {
                      setState(() {
                        _isShowClear = false;
                      });
                    } else if (!_isShowClear && text.length > 0) {
                      setState(() {
                        _isShowClear = true;
                      });
                    }
                  },
                  onSubmitted: (text) {
                    //  内容提交回调
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: new TextField(
                  controller: _pwdTextEditingController,
                  autocorrect: true,
                  obscureText: !_isShowPwd,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      labelText: '密码',
                      hintText: '请输入密码',
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(
                          color: Color(0xFF999999),
                          width: 0.6
                      )),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(
                          color: Color(0xFF333333),
                          width: 0.6
                      )),
                      suffixIcon: IconButton(
                        iconSize: 16.0,
                        icon: Icon(_isShowPwd
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isShowPwd = !_isShowPwd;
                          });
                        },
                      )),
                  onChanged: (text) {
                    // 内容监听回调
                  },
                  onSubmitted: (text) {
                    //  内容提交回调
                  },
                ),
              ),
              Container(
                width: 800,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: FlatButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    onPressed: _onLoginClick,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '登录',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    )),
              )
            ],
          )
        ]));
  }

  @override
  AccountPresenter createPresenter() {
    return AccountPresenter();
  }

  void _onLoginClick() {
    final account = _accountTextEditingController.text;
    final password = _pwdTextEditingController.text;
    if (account.isEmpty || password.isNotEmpty) {
      return;
    }
    presenter.login(account, password);
  }

  void onLoginSuccess() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ArticlePage();
    }));
  }
}
