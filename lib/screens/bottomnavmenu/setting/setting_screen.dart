import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  // ตัวแปรไว้รับค่าจากฟอร์ม
  String _barcode;

  // สร้างตัวแปรสำหรับไว้ผูกกับแบบฟอร์ม
  final formKey = GlobalKey<FormState>();

  final fieldText = TextEditingController();

  void clearText(){
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: TextField(
                controller: fieldText,
                autofocus: true,
                keyboardType: TextInputType.number,
                maxLines: 1,
                textInputAction: TextInputAction.search,
                onSubmitted: (value){
                  setState(() {
                    _barcode = value.trim();
                    clearText();
                  });
                },
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text('${_barcode ?? "..."}'),
          )
        ],
      )
    );

  }
}