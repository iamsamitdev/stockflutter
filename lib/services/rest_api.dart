import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stockflutter/models/NewsDetailModel.dart';
import 'package:stockflutter/models/NewsModel.dart';
import 'package:stockflutter/models/UserModel.dart';

class CallAPI {

  // กำหนด header ของ api
  _setHeaders() => {
    'Content-Type':'application/json',
    'Accept':'application/json'
  };

  // กำหนด base url
  // final String baseAPIURL = 'http://localhost:8000/stockflutter_api/public/api/';
  final String baseAPIURL = 'https://www.itgenius.co.th/sandbox_api/cpallstockapi/public/api/';

  // Login API
  loginAPI(data) async {
    return await http.post(
      baseAPIURL+'login',
      body: jsonEncode(data),
      headers: _setHeaders()
    );
  }

  // Read User Profile
  Future<UserModel> getProfile(id) async {

    final response = await http.get(
      baseAPIURL+'users/'+id,
      headers: _setHeaders()
    );

    if(response.body != null){
      return userModelFromJson(response.body);
    }else{
      return null;
    }

  }

   // Read Lastest News
  Future<List<NewsModel>> getLastNews() async {
    final response = await http.get(
      baseAPIURL+'lastnews',
      headers: _setHeaders()
    );
    if(response.body != null){
      return newsModelFromJson(response.body);
    }else{
      return null;
    }
  }

  // Read All News
  Future<List<NewsModel>> getAllNews() async {
    final response = await http.get(
      baseAPIURL+'news',
      headers: _setHeaders()
    );
    if(response.body != null){
      return newsModelFromJson(response.body);
    }else{
      return null;
    }
  }

  // Read News By ID
  Future<NewsDetailModel> getNewsByID(id) async {
    final response = await http.get(
      baseAPIURL+'news/'+id,
      headers: _setHeaders()
    );
    if(response.body != null){
      return newsDetailModelFromJson(response.body);
    }else{
      return null;
    }
  }


}