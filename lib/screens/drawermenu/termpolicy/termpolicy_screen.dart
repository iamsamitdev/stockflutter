import 'package:flutter/material.dart';

class TermPolicyScreen extends StatefulWidget {
  TermPolicyScreen({Key key}) : super(key: key);

  @override
  _TermPolicyScreenState createState() => _TermPolicyScreenState();
}

class _TermPolicyScreenState extends State<TermPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TermPolicy'),
      ),
      body: Center(
        child: Text('TermPolicy Content'),
      ),
    );
  }
}