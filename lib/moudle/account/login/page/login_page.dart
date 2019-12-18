import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wan_android/moudle/account/account_presenter.dart';
import 'package:wan_android/moudle/article/page/article_page.dart';
import 'package:wan_android/mvp/mvp_export.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/widget/XTextField.dart';

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
                child: XTextField(
                  width: 300,
                  height: 50,
                  inputType: TextInputType.text,
                  prefixIcon: Icon(FontAwesomeIcons.user),
                  placeHolder: '用户名',
                  textColor: Colors.black87,
                  accentColor: Colors.amberAccent,
                  placeHolderColor: Colors.black45,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: XTextField(
                  width: 300,
                  height: 50,
                  inputType: TextInputType.text,
                  obscureText: true,
                  prefixIcon: Icon(FontAwesomeIcons.lock),
                  placeHolder: '密码',
                  textColor: Colors.black87,
                  accentColor: Colors.amberAccent,
                  placeHolderColor: Colors.black45,

                ),
              ),
              Container(
                width: 300,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: FlatButton(
                    color: Colors.black87,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: _onLoginClick,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '登录',
                        style: TextStyle(color: Colors.amberAccent, fontSize: 16.0),
                      ),
                    )),
              ),
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
