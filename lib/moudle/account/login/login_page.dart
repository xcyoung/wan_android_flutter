import 'package:flutter/material.dart';
import 'package:wan_android/model/account_repository.dart';
import 'package:wan_android/http/http_result_observable.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _accountTextEditingController = new TextEditingController();
  final _pwdTextEditingController = new TextEditingController();

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
                  maxLength: 100,
                  minLines: 1,
                  autocorrect: true,
                  decoration: new InputDecoration(
                    labelText: '请输入用户名',
                    helperText: '用户名',
                    icon: new Icon(Icons.account_box),
                  ),
                  onChanged: (text) {
                    // 内容监听回调
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
                  maxLength: 100,
                  minLines: 1,
                  autocorrect: true,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    labelText: '请输入密码',
                    helperText: '密码',
                    icon: new Icon(Icons.lock),
                  ),
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
                child: new FlatButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      final account = _accountTextEditingController.text;
                      final password = _pwdTextEditingController.text;
                      WanHttpResultObservable<Object>(
                          accountRepository.login(account, password)).watch((event) {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: new Text('对话框'),
                                content: Text('登录成功！'),
                                actions: <Widget>[],
                              );
                            });
                      }, (code, message) {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: new Text('对话框'),
                                content: Text('登录失败！'),
                                actions: <Widget>[],
                              );
                            });
                      });
                    },
                    child: new Padding(
                      padding: EdgeInsets.all(10),
                      child: new Text(
                        '登录',
                        style:
                            new TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    )),
              )
            ],
          )
        ]));
  }
}
