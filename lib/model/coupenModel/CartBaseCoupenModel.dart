class CartBaseCoupenModel {
  int? id;
  String? type;
  String? code;
  Details? details;
  int? discount;
  String? discountType;
  String? startDate;
  String? endDate;

  CartBaseCoupenModel(
      {this.id,
      this.type,
      this.code,
      this.details,
      this.discount,
      this.discountType,
      this.startDate,
      this.endDate});

  CartBaseCoupenModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    code = json['code'];
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
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
      data['details'] = this.details!.toJson();
    }
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}

class Details {
  String? minBuy;
  String? maxDiscount;

  Details({this.minBuy, this.maxDiscount});

  Details.fromJson(Map<String, dynamic> json) {
    minBuy = json['min_buy'];
    maxDiscount = json['max_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min_buy'] = this.minBuy;
    data['max_discount'] = this.maxDiscount;
    return data;
  }
}
