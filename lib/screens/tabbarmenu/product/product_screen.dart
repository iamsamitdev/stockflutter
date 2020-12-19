import 'package:flutter/material.dart';
import 'package:stockflutter/models/ProductModel.dart';
import 'package:stockflutter/screens/editproduct/editproduct_screen.dart';
import 'package:stockflutter/services/rest_api.dart';
import 'package:stockflutter/utils/utility.dart';
import 'package:intl/intl.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  // กำหนดรูปแบบการแสดงผลยอดเงิน
  final currency = NumberFormat.currency(locale: "en_US", symbol: "");

  // CallAPI
  CallAPI callAPI;

  // สร้าง Context
  BuildContext context;

  @override
  void initState() { 
    super.initState();
    callAPI = CallAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: callAPI.getProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot){
          if(snapshot.hasError){
            // ถ้าโหลดข้อมูลไม่ได้มีข้อผิดพลาด
            return Utility().showAlertDialog(context, 'มีข้อผิดพลาด', snapshot.error.toString());
          }else if(snapshot.connectionState == ConnectionState.done){
            // ถ้าโหลดข้อมูลสำเร็จ
            List<ProductModel> products = snapshot.data;
            return _listViewProduct(products);
          }else{
            // ระหว่างที่กำลังโหลดข้อมูล
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/addproduct');
        },
        child: Icon(Icons.add, color: Colors.white, size: 30,),
        backgroundColor: Colors.red,
        splashColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // สร้าง ListView สำหรับแสดงรายการสินค้า
  Widget _listViewProduct(List<ProductModel> products){
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index){
        // Load Model
        ProductModel product = products[index];
        return Card(
          child: InkWell(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(product.productImage),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top:5.0, bottom: 5.0,left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.productName, 
                                style: TextStyle(fontSize: 24),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                product.productBarcode, 
                                style: TextStyle(fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                currency.format(double.parse(product.productPrice)),
                                // product.productPrice,
                                style: TextStyle(fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        )
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton(
                        onPressed: (){
                          
                          Navigator.pushNamed(
                              context,
                              '/editproduct',
                              arguments: ScreenArguments(
                                product.id,
                                product.productName,
                                product.productDetail,
                                product.productBarcode,
                                product.productPrice,
                                product.productQty,
                                product.productImage                                
                              ),
                            )
                            .then((value) => setState(() {
                              callAPI.getProducts();
                            }));


                        },
                        child: Text('แก้ไข', style: TextStyle(color: Colors.white),),
                        color: Colors.orange,
                      ),
                      SizedBox(width: 10,),
                      RaisedButton(
                        onPressed: (){

                          return showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('ยืนยันการลบข้อมูล'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text('รายการนี้จะถูกลบออกอย่างถาวร'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('ไม่'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text('ยืนยัน'),
                                    onPressed: () async {
                                      var response = await CallAPI().deleteProduct(product.id);
                                      if (response == true) {
                                        //Navigator.pushNamed(context, '/stockscreen');
                                        Navigator.pop(context, true);
                                        setState(() {
                                          callAPI.getProducts();
                                        });
                                      }
                                    },
                                  ),
                                ],
                              );
                            },
                          );

                        },
                        child: Text('ลบ', style: TextStyle(color: Colors.white),),
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }

}