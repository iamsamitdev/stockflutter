import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockflutter/screens/bottomnavmenu/account/account_screen.dart';
import 'package:stockflutter/screens/bottomnavmenu/home/home_screen.dart';
import 'package:stockflutter/screens/bottomnavmenu/notification/notification_screen.dart';
import 'package:stockflutter/screens/bottomnavmenu/report/report_screen.dart';
import 'package:stockflutter/screens/bottomnavmenu/setting/setting_screen.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  // สร้าง Ojbect แบบ Sharedprefference
  SharedPreferences sharedPreferences;

  // สร้างตัวแปรไว้อ่านข้อมูลจาก Sharedprefference
  String _fullname, _imgprofile, _username;

  // สร้างฟังก์ชันแบบ Async เพื่ออ่านข้อมูล sharedPreferences
  checkLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _fullname = sharedPreferences.getString('storeFullname');
      _imgprofile = sharedPreferences.getString('storeImgProfile');
      _username = sharedPreferences.getString('storeUsername');
    });
  }

  @override
  void initState() { 
    super.initState();
    checkLogin();
  }

  // สร้างตัวแปรแบบ list เก็บรายการหน้าของ tab bottom
  int _currentIndex = 0;
  String _title = 'หน้าหลัก';

  List<Widget> _children = [
    HomeScreen(),
    ReportScreen(),
    NotificationScreen(),
    SettingScreen(),
    AccountScreen()
  ];

  // เขียนเงื่อนไขเพื่อสลับเปลี่ยน Tab
  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          _title = 'หน้าหลัก';
          break;
        case 1:
          _title = 'รายงาน';
          break;
        case 2:
          _title = 'แจ้งเตือน';
          break;
        case 3:
          _title = 'ตั้งค่า';
          break;
        case 4:
          _title = 'ฉัน';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_title'),
      ),
      body: _children[_currentIndex],
      drawer: SafeArea(
          child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: 
                NetworkImage(
                  'https://www.itgenius.co.th/sandbox_api/cpallstockapi/public/images/profile/$_imgprofile'
                ),
              ),
              accountName: Text('$_fullname'),
              accountEmail: Text('$_username'),
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg_acc.jpg'),
                      fit: BoxFit.fill)),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('เกี่ยวกับเรา'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('ข้อมูลการใช้งาน'),
              onTap: () {
                Navigator.pushNamed(context, '/termpolicy');
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('ติดต่อทีมงาน'),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('ออกจากระบบ'),
              onTap: () async {
                // เคลียร์ SharedPrefferences
                // await sharedPreferences.clear();
                sharedPreferences.setInt('storeStep', 2);
                // ส่งไปหน้า login
                Navigator.pushReplacementNamed(context, '/lockscreen');
              },
            ),
          ],
        ),
       )
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        backgroundColor: Colors.teal,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white,),
            title: Text('หน้าหลัก', style: TextStyle(color: Colors.white),)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart, color: Colors.white,),
            title: Text('รายงาน',style: TextStyle(color: Colors.white))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.white,),
            title: Text('แจ้งเตือน',style: TextStyle(color: Colors.white))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white,),
            title: Text('ตั้งค่า',style: TextStyle(color: Colors.white))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white,),
            title: Text('ฉัน',style: TextStyle(color: Colors.white))
          ),
        ]
      ),
    );
  }
}