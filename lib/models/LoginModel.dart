import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        this.code,
        this.status,
        this.message,
        this.data,
    });

    String code;
    String status;
    String message;
    Data data;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.username,
        this.password,
        this.fullname,
        this.imgProfile,
        this.status,
    });

    String id;
    String username;
    String password;
    String fullname;
    String imgProfile;
    String status;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        username: json["username"] == null ? null : json["username"],
        password: json["password"] == null ? null : json["password"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        imgProfile: json["img_profile"] == null ? null : json["img_profile"],
        status: json["status"] == null ? null : json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "username": username == null ? null : username,
        "password": password == null ? null : password,
        "fullname": fullname == null ? null : fullname,
        "img_profile": imgProfile == null ? null : imgProfile,
        "status": status == null ? null : status,
    };
}