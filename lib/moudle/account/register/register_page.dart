import 'package:wan_android/moudle/account/register/register_presenter.dart';
import 'package:wan_android/mvp/mvp_export.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/widget/XTextField.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends BaseState<RegisterPage, RegisterPresenter> {
  final _accountTextEditingController = new TextEditingController();
  final _pwdTextEditingController = new TextEditingController();
  final _confirmPwdTextEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              child: Icon(Icons.android),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))),
              child: XTextField(
                width: 300,
                height: 50,
                inputType: TextInputType.text,
                placeHolder: '用户名',
                textColor: Colors.black87,
                accentColor: Colors.amberAccent,
                placeHolderColor: Colors.black45,
                controller: _accountTextEditingController,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))),
              child: XTextField(
                width: 300,
                height: 50,
                inputType: TextInputType.text,
                obscureText: true,
                placeHolder: '密码',
                textColor: Colors.black87,
                accentColor: Colors.amberAccent,
                placeHolderColor: Colors.black45,
                controller: _pwdTextEditingController,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))),
              child: XTextField(
                width: 300,
                height: 50,
                inputType: TextInputType.text,
                obscureText: true,
                placeHolder: '确认密码',
                textColor: Colors.black87,
                accentColor: Colors.amberAccent,
                placeHolderColor: Colors.black45,
                controller: _confirmPwdTextEditingController,
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
                  onPressed: _onRegClick,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '注册',
                      style:
                          TextStyle(color: Colors.amberAccent, fontSize: 16.0),
                    ),
                  )),
            ),
          ],
        )
      ]),
    );
  }

  @override
  RegisterPresenter createPresenter() {
    return RegisterPresenter();
  }

  void _onRegClick() {
    final account = _accountTextEditingController.text;
    final password = _pwdTextEditingController.text;
    final confirm = _confirmPwdTextEditingController.text;
    if (account.isEmpty || password.isEmpty || confirm.isEmpty) {
      return;
    }
    if (password != confirm) return;

    presenter.login(account, password);
  }

  void onRegSuccess() {
    Navigator.pop(context);
  }
}
