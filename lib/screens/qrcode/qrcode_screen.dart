import 'package:flutter/material.dart';
import 'package:stockflutter/screens/qrcode/mycode_screen.dart';
import 'package:stockflutter/screens/qrcode/scanner_screen.dart';

class QRCodeScreen extends StatefulWidget {
  QRCodeScreen({Key key}) : super(key: key);

  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {


  @override
  void initState() { 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('คิวอาร์โค้ด'),
        ),
        body: DefaultTabController(
        length: 2, 
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              automaticallyImplyLeading: false,
              bottom: TabBar(
                tabs: [
                  Tab(text: 'ตัวแสกน',),
                  Tab(text: 'โค้ดของฉัน',)
                ]
              ),
            ), 
          ),
          body: TabBarView(
            children: [
              ScannerScreen(),
              MyCodeScreen(),
            ]
          ),
        )
      ),
    );
  }
}