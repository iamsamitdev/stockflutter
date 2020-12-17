import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockflutter/services/rest_api.dart';
import 'package:stockflutter/utils/utility.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // สร้างตัวแปรสำหรับไว้ผูกกับแบบฟอร์ม
  final formKey = GlobalKey<FormState>();

  // ตัวแปรไว้รับค่าจากฟอร์ม
  String _username, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.teal,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.fill
          )
        ),
        child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', width: 100, height: 100,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                          key: formKey,
                          child: Column(
                          children: [
                            TextFormField(
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              style: TextStyle(fontSize: 24, color: Colors.teal),
                              decoration: InputDecoration(
                                icon: Icon(Icons.person, size: 28,),
                                labelText: 'Username',
                                hintText: 'กรุณาป้อนชื่อผู้ใช้',
                                hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                                errorStyle: TextStyle(fontSize: 16)
                              ),
                              validator: (value){
                                if(value.isEmpty){
                                  return 'กรุณาป้อนชื่อผู้ใช้ก่อน';
                                }else{
                                  return null;
                                }
                              },
                              onSaved: (value){
                                _username = value.trim();
                              },
                            ),
                            TextFormField(
                              autofocus: false,
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              style: TextStyle(fontSize: 24, color: Colors.teal),
                              decoration: InputDecoration(
                                icon: Icon(Icons.lock, size: 28,),
                                labelText: 'Password',
                                hintText: 'กรุณาป้อนรหัสผ่าน',
                                hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                                errorStyle: TextStyle(fontSize: 16)
                              ),
                              validator: (value){
                                if(value.isEmpty){
                                  return 'กรุณาป้อนรหัสผ่านก่อน';
                                }else{
                                  return null;
                                }
                              },
                              onSaved: (value){
                                _password = value.trim();
                              },
                            ),
                            SizedBox(height: 24,),
                            RaisedButton(
                              onPressed: () async {
                                if(formKey.currentState.validate()){
                                  formKey.currentState.save();

                                  // ทดสอบเรียกใช้งาน API
                                  var response = await CallAPI().loginAPI(
                                    {
                                      "username": _username,
                                      "password": _password
                                    }
                                  );

                                  var body = json.decode(response.body);
                                  if(body['status'] == 'success' && body['data']['status'] == '1'){
                                    
                                    // สร้าง Ojbect แบบ Sharedprefference
                                    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

                                    // เก็บค่าที่ต้องการลงในตัวแปรแบบ Sharedprefference
                                    sharedPreferences.setString('storeID', body['data']['id']);
                                    sharedPreferences.setString('storeFullname', body['data']['fullname']);
                                    sharedPreferences.setString('storeImgProfile', body['data']['img_profile']);
                                    sharedPreferences.setString('storeUsername', body['data']['username']);

                                    // ส่งไปหน้า Dashboard
                                    Navigator.pushReplacementNamed(context, '/dashboard');
                                  }else{
                                    Utility().showAlertDialog(context, 'มีข้อผิดพลาด', 'ข้อมูลเข้าระบบไม่ถูกต้อง');
                                  }

                                }
                              },
                              child: Padding(
                                // padding: const EdgeInsets.only(left: 20, right: 20),
                                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 24),),
                              ),
                              color: Colors.green,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
          ),
            ),
        ),
      ),
    );
  }
}