import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockflutter/routers.dart';
import 'package:stockflutter/themes/style.dart';

var storeStep;
var initURL;

void main() async {
  
  // กำหนดให้สามารถเรียก Widget จากภายนอกได้
  WidgetsFlutterBinding.ensureInitialized();

  // อ่านข้อมูลจาก SharedPreference
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  storeStep = sharedPreferences.getInt('storeStep');

  // เขียนเงื่อนไขเพื่อกำหนด URL
  if(storeStep == 1){
    initURL = '/dashboard';
  }else if(storeStep == 2){
    initURL = '/lockscreen';
  }else{
    initURL = '/onboarding';
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      initialRoute: initURL,
      routes: routes,
    );
  }
}