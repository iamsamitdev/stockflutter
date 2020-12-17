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
      });
      print(userModel.fullname);      
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
            color: Colors.teal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'http://localhost:8000/stockflutter_api/public/images/profile/admin.jpg',
                  ),
                  radius: 50,
                ),
                Text('Samit Koyom', style: TextStyle(color: Colors.white, fontSize: 24),),
                Text('Administrator', style: TextStyle(color: Colors.white, fontSize: 16),),
              ],
            ),
          )
        ],
      ),
    );
  }
}