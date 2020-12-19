import 'package:flutter/material.dart';
import 'package:stockflutter/models/NewsDetailModel.dart';
import 'package:stockflutter/services/rest_api.dart';

class NewsDetailScreen extends StatefulWidget {
  NewsDetailScreen({Key key}) : super(key: key);

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  
  // เรียกใช้งาน Model
  NewsDetailModel _dataNews;

  // สร้างฟังก์ชันอ่านข้อมูลข่าว
  readNewsDetail(id) async {
    try{
      var response = await CallAPI().getNewsByID(id);
      print(response.topic);
      setState(() {
        _dataNews = response;
      });
    }catch (error){
      print(error);
    }
  }


  @override
  Widget build(BuildContext context) {

    // การรับค่าจาก arguments
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    // เรียกฟังก์ชัน readNewsDetail
    readNewsDetail(arguments['id'].toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('${_dataNews?.topic ?? "..."}'),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(_dataNews?.imageurl ?? "..."),
                fit: BoxFit.cover
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('${_dataNews?.topic ?? "..."}', 
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('${_dataNews?.detail ?? "..."}', 
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('${_dataNews?.createdAt ?? "..."}', 
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('${_dataNews?.status ?? "..."}', 
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );;
  }
}