import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wan_android/generated/i18n.dart';
import 'package:wan_android/moudle/account/login/login_presenter.dart';
import 'package:wan_android/moudle/home/home_page.dart';
import 'package:wan_android/mvp/mvp_export.dart';
import 'package:wan_android/res/color/color_manager.dart';
import 'package:wan_android/utils/toast_extension.dart';
import 'package:wan_android/widget/wave_widget.dart';
import 'package:wan_android/widget/x_textfield.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends BaseState<LoginPage, LoginPresenter>
    with SingleTickerProviderStateMixin {
  final _loginAccountController = new TextEditingController();
  final _loginPwdController = new TextEditingController();
  final _regAccountController = new TextEditingController();
  final _regPwdController = new TextEditingController();
  final _confirmPwdTextEditingController = new TextEditingController();
  var _curPosition = 0;
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _tabController.addListener(() {
      var index = _tabController.index;
      setState(() {
        _curPosition = index;
      });
      print("index: $index");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Color(0xEE03A9F4)));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [ColorManager.of(context).color_blue1, ColorManager.of(context).color_bg],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: WaveWidget(
                waveAmplitude: 18.0,
                bgColor: ColorManager.of(context).color_blue1,
                size: Size(800.0, 150.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 120),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        Container(
                            constraints: BoxConstraints.expand(height: 300),
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(1.0, 3.0),
                                  blurRadius: 5.0,
                                )
                              ],
                            ),
                            child: DefaultTabController(
                                length: 2,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      constraints:
                                          BoxConstraints.expand(height: 50),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black26,
                                                  width: 1.0,
                                                  style: BorderStyle.solid))),
                                      child: TabBar(
                                        controller: _tabController,
                                        labelColor: Colors.blue,
                                        unselectedLabelColor: Colors.black26,
                                        indicatorWeight: 5.0,
                                        indicatorPadding:
                                            EdgeInsets.fromLTRB(16, 8, 16, 0),
                                        labelStyle: TextStyle(
                                            fontSize: 18, letterSpacing: 5.0),
                                        tabs: [
                                          Tab(
                                            text: S
                                                .of(context)
                                                .wan_account_tab_title_login,
                                          ),
                                          Tab(
                                            text: S
                                                .of(context)
                                                .wan_account_tab_title_reg,
                                          )
                                        ],
                                        isScrollable: false,
                                      ),
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(16, 8, 16, 8),
                                      child: TabBarView(
                                        controller: _tabController,
                                        physics: NeverScrollableScrollPhysics(),
                                        children: <Widget>[
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    8, 16, 8, 0),
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            width: 1,
                                                            color: Color(
                                                                0xffe5e5e5)))),
                                                child: XTextField(
                                                  width: 300,
                                                  height: 50,
                                                  inputType: TextInputType.text,
                                                  placeHolder: S
                                                      .of(context)
                                                      .wan_account_user_name_hint,
                                                  textColor: Colors.black87,
                                                  accentColor: Colors.black54,
                                                  placeHolderColor:
                                                      Colors.black45,
                                                  prefixIcon: Icon(
                                                    FontAwesomeIcons.user,
                                                    color: Colors.black54,
                                                    size: 20.0,
                                                  ),
                                                  controller:
                                                      _loginAccountController,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    8, 16, 8, 0),
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            width: 1,
                                                            color: Color(
                                                                0xffe5e5e5)))),
                                                child: XTextField(
                                                  width: 300,
                                                  height: 50,
                                                  inputType: TextInputType.text,
                                                  obscureText: true,
                                                  placeHolder: S
                                                      .of(context)
                                                      .wan_account_user_pwd_hint,
                                                  textColor: Colors.black87,
                                                  accentColor: Colors.black54,
                                                  placeHolderColor:
                                                      Colors.black45,
                                                  prefixIcon: Icon(
                                                    Icons.lock,
                                                    color: Colors.black54,
                                                    size: 24.0,
                                                  ),
                                                  controller:
                                                      _loginPwdController,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    8, 0, 8, 0),
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            width: 1,
                                                            color: Color(
                                                                0xffe5e5e5)))),
                                                child: XTextField(
                                                  width: 300,
                                                  height: 50,
                                                  inputType: TextInputType.text,
                                                  placeHolder: S
                                                      .of(context)
                                                      .wan_account_user_name_hint,
                                                  textColor: Colors.black87,
                                                  accentColor:
                                                      Colors.amberAccent,
                                                  placeHolderColor:
                                                      Colors.black45,
                                                  prefixIcon: Icon(
                                                    FontAwesomeIcons.user,
                                                    color: Colors.black54,
                                                    size: 20.0,
                                                  ),
                                                  controller:
                                                      _regAccountController,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    8, 16, 8, 0),
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            width: 1,
                                                            color: Color(
                                                                0xffe5e5e5)))),
                                                child: XTextField(
                                                  width: 300,
                                                  height: 50,
                                                  inputType: TextInputType.text,
                                                  obscureText: true,
                                                  placeHolder: S
                                                      .of(context)
                                                      .wan_account_user_pwd_hint,
                                                  textColor: Colors.black87,
                                                  accentColor:
                                                      Colors.amberAccent,
                                                  placeHolderColor:
                                                      Colors.black45,
                                                  prefixIcon: Icon(
                                                    Icons.lock,
                                                    color: Colors.black54,
                                                    size: 24.0,
                                                  ),
                                                  controller: _regPwdController,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    8, 16, 8, 0),
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            width: 1,
                                                            color: Color(
                                                                0xffe5e5e5)))),
                                                child: XTextField(
                                                  width: 300,
                                                  height: 50,
                                                  inputType: TextInputType.text,
                                                  obscureText: true,
                                                  placeHolder: S
                                                      .of(context)
                                                      .wan_account_user_pwd_confirm_hint,
                                                  textColor: Colors.black87,
                                                  accentColor:
                                                      Colors.amberAccent,
                                                  placeHolderColor:
                                                      Colors.black45,
                                                  prefixIcon: Icon(
                                                    Icons.lock,
                                                    color: Colors.black54,
                                                    size: 24.0,
                                                  ),
                                                  controller:
                                                      _confirmPwdTextEditingController,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ))
                                  ],
                                ))),
                        Container(
                          width: 250,
                          padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                          child: FlatButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () {
                                if (_curPosition == 0) {
                                  _onLoginClick();
                                } else {
                                  _onRegClick();
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  _curPosition == 0 ? '登录' : '注册',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      alignment: Alignment.bottomCenter,
                      child: Text('create by xcyoung'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  LoginPresenter createPresenter() {
    return LoginPresenter();
  }

  void _onLoginClick() {
    final account = _loginAccountController.text;
    final password = _loginPwdController.text;
    if (account.isEmpty || password.isEmpty) {
      widget.toast(S.of(context).wan_common_form_error_message);
      return;
    }
    widget.showLoading();
    presenter.login(account, password);
  }

  void _onRegClick() {
    final account = _regAccountController.text;
    final password = _regPwdController.text;
    final confirm = _confirmPwdTextEditingController.text;
    if (account.isEmpty || password.isEmpty || confirm.isEmpty) {
      widget.toast(S.of(context).wan_common_form_error_message);
      return;
    }
    if (password != confirm) {
      widget.toast(S.of(context).wan_account_pwd_no_equal);
      return;
    }
    widget.showLoading();
    presenter.reg(account, password, confirm);
  }

  void onLoginSuccess() {
    widget.hideLoading();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage();
    }));
  }

  void onRegSuccess() {
    widget.hideLoading();
    _tabController.index = 0;
  }

  @override
  void onError(int code, String message) {
    widget.hideLoading();
    widget.toastError(code, message);
  }
}
