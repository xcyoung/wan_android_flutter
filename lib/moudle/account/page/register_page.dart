import 'package:flutter/material.dart';
import 'package:wan_android/common/route/route.dart';
import 'package:wan_android/http/http_export.dart' show WanHttpResultObservable;
import 'package:wan_android/model/repository.dart';
import 'package:wan_android/utils/toast_extension.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _account;
  String _password;

  void _register() {
    repository.register(_account, _password, _password).then((response) {
      WanHttpResultObservable(response).watch((result) {
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
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 30,
                  margin: const EdgeInsets.fromLTRB(8, 16, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      icon: Icon(Icons.arrow_back), onPressed: () {
                    RouteCenter.instance.pop(context);
                  })),
              const SizedBox(height: 16.0),
              Container(
                padding: const EdgeInsets.all(32.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  '注册',
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
                        SizedBox(height: 24.0),
                        TextFormField(
                          maxLines: 1,
                          textCapitalization: TextCapitalization.words,
                          style: TextStyle(color: Colors.black87),
                          cursorColor: Color(0xFF00BFA6),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.confirmation_number,
                                color: Colors.black87),
                            border: UnderlineInputBorder(),
                            filled: false,
                            hintText: '请确认密码',
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
                            if (value.isEmpty) {
                              return "请确认密码";
                            } else if (value != _password) {
                              return "两次密码不一致";
                            }
                            return null;
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
                                  _register();
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                                child: Text(
                                  '提交',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              )),
                        ),
                      ],
                    )),
              ),
              Expanded(
                child: Container(
                    alignment: Alignment.bottomRight,
                    child: Image.asset('resource/images/img_bg_register.png',
                        width: MediaQuery.of(context).size.width * 0.7)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
