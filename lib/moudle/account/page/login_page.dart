import 'package:flutter/material.dart';
import 'package:wan_android/common/route/route.dart';
import 'package:wan_android/http/http_export.dart' show WanHttpResultObservable;
import 'package:wan_android/model/repository.dart';
import 'package:wan_android/utils/toast_extension.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _account;
  String _password;

  void _login() {
    repository.login(_account, _password).then((response) {
      WanHttpResultObservable(response)
          .watch((result) {
        RouteCenter.instance.pop(context);
      }, (code, message) {
        widget.toastError(code, message);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage('resource/images/img_bg_login.png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 30,
                  margin: const EdgeInsets.fromLTRB(8, 16, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: IconButton(icon: Icon(Icons.close), onPressed: () {
                    RouteCenter.instance.pop(context);
                  })),
              const SizedBox(height: 130.0),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  '登录',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextFormField(
                          maxLines: 1,
                          textCapitalization: TextCapitalization.words,
                          style: TextStyle(color: Colors.black87),
                          cursorColor: Color(0xFF00BFA6),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.android,
                              color: Colors.black87,
                            ),
                            border: UnderlineInputBorder(),
                            filled: false,
                            hintText: '请输入用户名',
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF00BFA6))),
                          ),
                          onSaved: (value) {
                            _account = value;
                          },
                          validator: (value) {
                            return value.isEmpty ? "请输入用户名" : null;
                          },
                        ),
                        SizedBox(height: 24.0),
                        TextFormField(
                          maxLines: 1,
                          textCapitalization: TextCapitalization.words,
                          style: TextStyle(color: Colors.black87),
                          cursorColor: Color(0xFF00BFA6),
                          decoration: const InputDecoration(
                            prefixIcon:
                                Icon(Icons.lock_outline, color: Colors.black87),
                            border: UnderlineInputBorder(),
                            filled: false,
                            hintText: '请输入密码',
                            focusColor: Color(0xFF00BFA6),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF00BFA6))),
                          ),
                          obscureText: true,
                          onSaved: (value) {
                            _password = value;
                          },
                          validator: (value) {
                            return value.isEmpty ? "请输入密码" : null;
                          },
                        ),
                        SizedBox(height: 32.0),
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: FlatButton(
                              color: Color(0xFF00BFA6),
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {
                                final FormState form = _formKey.currentState;
                                if (!form.validate()) {
//                              state.toast('请输入完整信息');
                                  print('error');
                                } else {
                                  form.save();
                                  _login();
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                                child: Text(
                                  '登录',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              )),
                        ),
                        GestureDetector(
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.fromLTRB(0, 8, 16, 0),
                            child: Text('还没有账号，注册一个？'),
                          ),
                          onTap: () {
                            RouteCenter.instance.goToRegister(context);
                          },
                        )
                      ],
                    )),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32.0),
                  margin: EdgeInsets.only(bottom: 30),
                  alignment: Alignment.bottomCenter,
                  child: Text('create by xcyoung'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
