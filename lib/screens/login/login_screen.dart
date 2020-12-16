import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    color: Colors.white70,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 24, color: Colors.teal),
                            decoration: InputDecoration(
                              icon: Icon(Icons.person, size: 28,),
                              labelText: 'Username',
                              hintText: 'กรุณาป้อนชื่อผู้ใช้'
                            ),
                          ),
                          TextFormField(
                            autofocus: false,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 24, color: Colors.teal),
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock, size: 28,),
                              labelText: 'Password',
                              hintText: 'กรุณาป้อนรหัสผ่าน'
                            ),
                          ),
                          SizedBox(height: 24,),
                          RaisedButton(
                            onPressed: (){},
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
                )
              ],
          ),
            ),
        ),
      ),
    );
  }
}