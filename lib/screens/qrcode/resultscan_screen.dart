import 'package:flutter/material.dart';

class ResultScanScfeen extends StatefulWidget {
  ResultScanScfeen({Key key}) : super(key: key);

  @override
  _ResultScanScfeenState createState() => _ResultScanScfeenState();
}

class _ResultScanScfeenState extends State<ResultScanScfeen> {
  String _reslutScan;

  @override
  Widget build(BuildContext context) {

    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    if (arguments != null){
      _reslutScan = arguments['result'];
    }else{
      _reslutScan = 'No data';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Result'),
      ),
      body: SizedBox(
          width: double.infinity,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ข้อมูลที่ได้'),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$_reslutScan', style: TextStyle(fontSize: 20),
                  ),
                )
              ),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/qrcode');
              },
              child: Text('แสกนอีกครั้ง', style: TextStyle(color: Colors.white, fontSize: 20),),
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}