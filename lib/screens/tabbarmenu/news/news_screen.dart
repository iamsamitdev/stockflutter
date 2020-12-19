import 'package:flutter/material.dart';
import 'package:stockflutter/models/NewsModel.dart';
import 'package:stockflutter/services/rest_api.dart';
import 'package:stockflutter/utils/utility.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'ข่าวประกาศล่าสุด', 
              style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold
              )
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            child: FutureBuilder(
              future: CallAPI().getLastNews(),
              builder: (BuildContext context, AsyncSnapshot<List<NewsModel>> snapshot){
                if(snapshot.hasError){
                  // ถ้าโหลดข้อมูลไม่ได้มีข้อผิดพลาด
                  return Utility().showAlertDialog(context, 'มีข้อผิดพลาด', snapshot.error.toString());
                }else if(snapshot.connectionState == ConnectionState.done){
                  // ถ้าโหลดข้อมูลสำเร็จ
                  List<NewsModel> news = snapshot.data;
                  return _listViewLastNews(news);
                }else{
                  // ระหว่างที่กำลังโหลดข้อมูล
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'ข่าวประกาศทั้งหมด', 
              style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold
              )
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            child: FutureBuilder(
              future: CallAPI().getAllNews(),
              builder: (BuildContext context, AsyncSnapshot<List<NewsModel>> snapshot){
                if(snapshot.hasError){
                  // ถ้าโหลดข้อมูลไม่ได้มีข้อผิดพลาด
                  return Utility().showAlertDialog(context, 'มีข้อผิดพลาด', snapshot.error.toString());
                }else if(snapshot.connectionState == ConnectionState.done){
                  // ถ้าโหลดข้อมูลสำเร็จ
                  List<NewsModel> news = snapshot.data;
                  return _listViewAllNews(news);
                }else{
                  // ระหว่างที่กำลังโหลดข้อมูล
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
            ),
          ),
        ],
      )
    );
  }

  // สร้าง ListView สำหรับการแสดงข่าวล่าสุด
  Widget _listViewLastNews(List<NewsModel> news){
    return ListView.builder(
      scrollDirection: Axis.horizontal, // Listview แนวนอน
      itemCount: news.length,
      itemBuilder: (context, index){
        // Load Model
        NewsModel newsModel = news[index];
        // ออกแบบส่วนหน้าตาของการแสดงผล listview
        return Container(
          width: MediaQuery.of(context).size.width * 0.60,
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(
                context, 
                '/newsdetail',
                arguments: {'id': newsModel.id}
              );
            },
            child: Card(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 125.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(newsModel.imageurl),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            newsModel.topic,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            newsModel.detail,
                            style: TextStyle(fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }


  // สร้าง ListView สำหรับการแสดงข่าวทั้งหมด
  Widget _listViewAllNews(List<NewsModel> news){
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: news.length,
      itemBuilder: (context, index){
        // Load Model
        NewsModel newsModel = news[index];
        return ListTile(
          leading: Icon(Icons.pages),
          title: Text(newsModel.topic, overflow: TextOverflow.ellipsis,),
          subtitle: Text(newsModel.detail, overflow: TextOverflow.ellipsis,),
          onTap: (){
            Navigator.pushNamed(
                context, 
                '/newsdetail',
                arguments: {'id': newsModel.id}
            );
          },
        );
      }
    );
  }

}