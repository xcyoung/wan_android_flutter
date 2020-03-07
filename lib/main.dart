import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wan_android/common/route/route.dart';
import 'package:wan_android/generated/i18n.dart';
import 'package:wan_android/http/http_export.dart' show HttpManager;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HttpManager.getInstance().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const MaterialColor a = MaterialColor(
      0xFF00BFA6,
      <int, Color>{
        50: Color(0xFFFFF3E0),
        100: Color(0xFFFFE0B2),
        200: Color(0xFFFFCC80),
        300: Color(0xFFFFB74D),
        400: Color(0xFFFFA726),
        500: Color(0xFF00BFA6),
        600: Color(0xFFFB8C00),
        700: Color(0xFFF57C00),
        800: Color(0xFFEF6C00),
        900: Color(0xFFE65100),
      },
    );
    return BotToastInit(
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: ThemeData(primaryColor: Color(0xFF00BFA6), primarySwatch: a),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        initialRoute: Path.Home,
        onGenerateRoute: RouteCenter.instance.onGenerateRoute,
      ),
    );
  }
}

//class MyAppState extends State<MyApp> {
//
//  @override
//  void initState() {
//    super.initState();
//    _initAsync();
//  }
//
//  void _initAsync() async {
//    await HttpManager.getInstance().init();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    const MaterialColor a = MaterialColor(
//      0xFF00BFA6,
//      <int, Color>{
//        50: Color(0xFFFFF3E0),
//        100: Color(0xFFFFE0B2),
//        200: Color(0xFFFFCC80),
//        300: Color(0xFFFFB74D),
//        400: Color(0xFFFFA726),
//        500: Color(0xFF00BFA6),
//        600: Color(0xFFFB8C00),
//        700: Color(0xFFF57C00),
//        800: Color(0xFFEF6C00),
//        900: Color(0xFFE65100),
//      },
//    );
//    return BotToastInit(
//      child: MaterialApp(
//        title: 'Flutter Demo',
//        navigatorObservers: [BotToastNavigatorObserver()],
//        theme: ThemeData(primaryColor: Color(0xFF00BFA6), primarySwatch: a),
//        localizationsDelegates: [
//          S.delegate,
//          GlobalMaterialLocalizations.delegate,
//          GlobalWidgetsLocalizations.delegate,
//        ],
//        supportedLocales: S.delegate.supportedLocales,
//        initialRoute: Path.Home,
//        onGenerateRoute: RouteCenter.instance.onGenerateRoute,
//      ),
//    );
//  }
//
//}


