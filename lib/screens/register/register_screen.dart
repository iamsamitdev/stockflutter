import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // สร้างตัวแปรสำหรับไว้ผูกกับแบบฟอร์ม
  final formKey = GlobalKey<FormState>();

  // ตัวแปรไว้รับค่าจากฟอร์ม
  String _username, _password, _fullname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: Container(
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
                padding: const EdgeInsets.only(top: 70),
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
                                  labelText: 'Fullname',
                                  hintText: 'กรุณาป้อนชื่อ-สกุล',
                                  hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                                  errorStyle: TextStyle(fontSize: 16)
                                ),
                                validator: (value){
                                  if(value.isEmpty){
                                    return 'กรุณาป้อนชื่อ-สกุลก่อน';
                                  }else{
                                    return null;
                                  }
                                },
                                onSaved: (value){
                                  _fullname = value.trim();
                                },
                              ),
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
                                  }
                                },
                                child: Padding(
                                  // padding: const EdgeInsets.only(left: 20, right: 20),
                                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                  child: Text('REGISTER', style: TextStyle(color: Colors.white, fontSize: 24),),
                                ),
                                color: Colors.green,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text('ถ้าเป็นสมาชิกอยู่แล้ว', style: TextStyle(color: Colors.white),),
                  RaisedButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text('เข้าสู่ระบบ',style: TextStyle(color: Colors.white),),
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)
                    ),
                  )
                ],
            ),
              ),
          ),
        ),
      ),
    );
  }
}