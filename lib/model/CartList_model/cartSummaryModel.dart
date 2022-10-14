class cartSummaryModel {
  String? subTotal;
  String? tax;
  String? shippingCost;
  String? discount;
  String? savedAmount;
  double? savedAmountInPercentage;
  int? clubPoint;
  String? grandTotal;
  int? grandTotalValue;
  String? couponCode;
  bool? couponApplied;

  cartSummaryModel(
      {this.subTotal,
      this.tax,
      this.shippingCost,
      this.discount,
      this.savedAmount,
      this.savedAmountInPercentage,
      this.clubPoint,
      this.grandTotal,
      this.grandTotalValue,
      this.couponCode,
      this.couponApplied});

  cartSummaryModel.fromJson(Map<String, dynamic> json) {
    subTotal = json['sub_total'];
    tax = json['tax'];
    shippingCost = json['shipping_cost'];
    discount = json['discount'];
    savedAmount = json['saved_amount'];
    savedAmountInPercentage =
        double.parse(json['saved_amount_in_percentage'].toString());
    clubPoint = json['club_point'];
    grandTotal = json['grand_total'];
    grandTotalValue = json['grand_total_value'];
    couponCode = json['coupon_code'];
    couponApplied = json['coupon_applied'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_total'] = subTotal;
    data['tax'] = tax;
    data['shipping_cost'] = shippingCost;
    data['discount'] = discount;
    data['saved_amount'] = savedAmount;
    data['saved_amount_in_percentage'] = savedAmountInPercentage;
    data['club_point'] = clubPoint;
    data['grand_total'] = grandTotal;
    data['grand_total_value'] = grandTotalValue;
    data['coupon_code'] = couponCode;
    data['coupon_applied'] = couponApplied;
    return data;
  }
}
