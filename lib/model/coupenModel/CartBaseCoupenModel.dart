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
        json['details'] != null ? Details.fromJson(json['details']) : null;
    discount = json['discount'];
    discountType = json['discount_type'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['code'] = code;
    if (details != null) {
      data['details'] = details!.toJson();
    }
    data['discount'] = discount;
    data['discount_type'] = discountType;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['min_buy'] = minBuy;
    data['max_discount'] = maxDiscount;
    return data;
  }
}
