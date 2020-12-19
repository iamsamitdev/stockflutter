import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) => ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) => json.encode(data.toJson());

class ProductDetailModel {
    ProductDetailModel({
        this.id,
        this.productDetail,
        this.productName,
        this.productBarcode,
        this.productQty,
        this.productPrice,
        this.productDate,
        this.productImage,
        this.productCategory,
        this.productStatus,
    });

    String id;
    String productDetail;
    String productName;
    String productBarcode;
    String productQty;
    String productPrice;
    String productDate;
    String productImage;
    String productCategory;
    String productStatus;

    factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
        id: json["id"] == null ? null : json["id"],
        productDetail: json["product_detail"] == null ? null : json["product_detail"],
        productName: json["product_name"] == null ? null : json["product_name"],
        productBarcode: json["product_barcode"] == null ? null : json["product_barcode"],
        productQty: json["product_qty"] == null ? null : json["product_qty"],
        productPrice: json["product_price"] == null ? null : json["product_price"],
        productDate: json["product_date"] == null ? null : json["product_date"],
        productImage: json["product_image"] == null ? null : json["product_image"],
        productCategory: json["product_category"] == null ? null : json["product_category"],
        productStatus: json["product_status"] == null ? null : json["product_status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "product_detail": productDetail == null ? null : productDetail,
        "product_name": productName == null ? null : productName,
        "product_barcode": productBarcode == null ? null : productBarcode,
        "product_qty": productQty == null ? null : productQty,
        "product_price": productPrice == null ? null : productPrice,
        "product_date": productDate == null ? null : productDate,
        "product_image": productImage == null ? null : productImage,
        "product_category": productCategory == null ? null : productCategory,
        "product_status": productStatus == null ? null : productStatus,
    };
}
