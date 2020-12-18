import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockflutter/models/UserModel.dart';
import 'package:stockflutter/services/rest_api.dart';
import 'package:stockflutter/utils/utility.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  // สร้างตัวแปรไว้เก็บชื่อ และรูปโปรไฟล์
  String _fullname, _username, _avatar;

  SharedPreferences sharedPreferences;

  // เรียกใช้งาน Model
  UserModel userModel;
  
  // อ่าน API User Profile
  readUserProfile() async {
    // เช็คเครื่องผู้ใช้ว่า Online หรือ Offline
    var result = await Connectivity().checkConnectivity();
    if(result == ConnectivityResult.none){ // ถ้า offline อยู่
      Utility().showAlertDialog(context, 'มีข้อผิดพลาด', 'คุณยังไม่ได้เชื่อมต่ออินเตอร์เน็ต');
    }else{
      sharedPreferences = await SharedPreferences.getInstance();
      var response = await CallAPI().getProfile(sharedPreferences.getString('storeID'));
      setState(() {
        userModel = response;
        _fullname = userModel.fullname;
        _username = userModel.username;
        _avatar = userModel.imgProfile;
      });
      print(userModel.fullname);
      print(userModel.imgProfile);   
    }
  }

  @override
  void initState() { 
    super.initState();
    readUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage('assets/images/bg_acc.jpg'),
                 fit: BoxFit.cover
               )
             ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.white,
                    child:_avatar != null ? CircleAvatar(
                      radius: 46.0,
                      // backgroundImage: AssetImage('assets/images/samit_profile.jpg'),
                      backgroundImage: NetworkImage(
                        'https://www.itgenius.co.th/sandbox_api/cpallstockapi/public/images/profile/'+_avatar,
                      ),
                    ): CircularProgressIndicator(),
                  ),
                ),
                Text('${_fullname ?? "..." }', style: TextStyle(color: Colors.white, fontSize: 24),),
                Text('${_username ?? "..." }', style: TextStyle(color: Colors.white, fontSize: 16),),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('ข้อมูลผู้ใช้'),
            trailing: Icon(Icons.navigate_next),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('เปลี่ยนรหัสผ่าน'),
            trailing: Icon(Icons.navigate_next),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('เปลี่ยนภาษา'),
            trailing: Icon(Icons.navigate_next),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('ติดต่อทีมงาน'),
            trailing: Icon(Icons.navigate_next),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('ตั้งค่าใช้งาน'),
            trailing: Icon(Icons.navigate_next),
            onTap: (){},
          ),
           ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('ออกจากระบบ'),
            trailing: Icon(Icons.navigate_next),
            onTap: () async {
              // สร้าง Object แบบ Sharedprefference
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

              // เก็บค่าลงตัวแปรแบบ SharedPrefference
              sharedPreferences.setInt('storeStep', 2);

              // เมื่อทำการเรียกไปหน้าสุด
              // ส่งไปหน้า login
              Navigator.pushReplacementNamed(context, '/lockscreen');
            },
          )
        ],
      ),
    );
  }
}