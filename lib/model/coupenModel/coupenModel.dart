class CoupenModel {
  int? id;
  String? type;
  String? code;
  List<Details>? details;
  int? discount;
  String? discountType;
  String? startDate;
  String? endDate;

  CoupenModel(
      {this.id,
      this.type,
      this.code,
      this.details,
      this.discount,
      this.discountType,
      this.startDate,
      this.endDate});

  CoupenModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    code = json['code'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
    discount = json['discount'];
    discountType = json['discount_type'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['code'] = this.code;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}

class Details {
  String? productId;

  Details({this.productId});

  Details.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    return data;
  }
}
