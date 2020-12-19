import 'package:flutter/material.dart';
import 'package:stockflutter/models/ProductModel.dart';
import 'package:stockflutter/services/rest_api.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({Key key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
 
  final formKey = GlobalKey<FormState>();
  String productName, productDetail, productBarcode, productPrice, productQty, productImage;

  Widget productNameText(){
    return TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'ชื่อสินค้า',
          labelStyle: TextStyle(
              color: Colors.teal, fontSize: 20
          ),
          errorStyle: TextStyle(fontSize: 16.0)
      ),
      validator: (value){
        if (value.isEmpty){
          return "* จำเป็น";
        }else{
          return null;
        }
      },
      onSaved: (value){
        productName = value;
      },
    );
  }

  Widget productDetailText(){
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'รายละเอียด',
          labelStyle: TextStyle(
              color: Colors.teal, fontSize: 20
          ),
          errorStyle: TextStyle(fontSize: 16.0)
      ),
      validator: (value){
        if (value.isEmpty){
          return "* จำเป็น";
        }else{
          return null;
        }
      },
      onSaved: (value){
        productDetail = value;
      },
    );
  }

  Widget productBarcodeText(){
    return TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'บาร์โค้ด',
          labelStyle: TextStyle(
              color: Colors.teal, fontSize: 20
          ),
          errorStyle: TextStyle(fontSize: 16.0)
      ),
      validator: (value){
        if (value.isEmpty){
          return "* จำเป็น";
        }else{
          return null;
        }
      },
      onSaved: (value){
        productBarcode = value;
      },
    );
  }

  Widget productQtyText(){
    return TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'จำนวน',
          labelStyle: TextStyle(
              color: Colors.teal, fontSize: 20
          ),
          errorStyle: TextStyle(fontSize: 16.0)
      ),
      validator: (value){
        if (value.isEmpty){
          return "* จำเป็น";
        }else{
          return null;
        }
      },
      onSaved: (value){
        productQty = value;
      },
    );
  }

  Widget productPriceText(){
    return TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'ราคา',
          labelStyle: TextStyle(
              color: Colors.teal, fontSize: 20
          ),
          errorStyle: TextStyle(fontSize: 16.0)
      ),
      validator: (value){
        if (value.isEmpty){
          return "* จำเป็น";
        }else{
          return null;
        }
      },
      onSaved: (value){
        productPrice = value;
      },
    );
  }

  Widget productImageText(){
    return TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'รูปภาพสินค้า',
          labelStyle: TextStyle(
              color: Colors.teal, fontSize: 20
          ),
          errorStyle: TextStyle(fontSize: 16.0)
      ),
      validator: (value){
        if (value.isEmpty){
          return "* จำเป็น";
        }else{
          return null;
        }
      },
      onSaved: (value){
        productImage = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เพิ่มสินค้าใหม่'),
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
                child: productNameText(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: productDetailText(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: productBarcodeText(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: productPriceText(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: productQtyText(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: productImageText(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
                child: RaisedButton(
                  onPressed:() async {

                    if (formKey.currentState.validate()){

                      formKey.currentState.save();
                      ProductModel productdata = new ProductModel(
                        productName:productName,
                        productDetail:productDetail,
                        productBarcode:productBarcode,
                        productImage:productImage,
                        productPrice: productPrice,
                        productQty:productQty
                      );

                      print(productdata);
                      var response = await CallAPI().createProduct(productdata);
                      print(response);
                      if (response == true) {
                        print(response);
                        Navigator.pop(context, true);
                      }

                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('บันทึกข้อมูล', style: TextStyle(fontSize: 20, color: Colors.white),),
                  ),
                  color: Colors.teal,
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}