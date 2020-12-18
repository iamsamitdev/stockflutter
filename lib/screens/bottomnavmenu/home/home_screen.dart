import 'package:flutter/material.dart';
import 'package:stockflutter/screens/tabbarmenu/news/news_screen.dart';
import 'package:stockflutter/screens/tabbarmenu/product/product_screen.dart';
import 'package:stockflutter/screens/tabbarmenu/stock/stock_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            bottom: TabBar(
              tabs: [
                Tab(text: 'ข่าวสาร',),
                Tab(text: 'สินค้า',),
                Tab(text: 'สถานะคงคลัง',),
              ]
            ),
          ), 
        ),
        body: TabBarView(
          children: [
            NewsScreen(),
            ProductScreen(),
            StockScreen()
          ]
        ),
      )
    );
  }
}