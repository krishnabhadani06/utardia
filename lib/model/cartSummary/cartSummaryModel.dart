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
    savedAmountInPercentage = json['saved_amount_in_percentage'];
    clubPoint = json['club_point'];
    grandTotal = json['grand_total'];
    grandTotalValue = json['grand_total_value'];
    couponCode = json['coupon_code'];
    couponApplied = json['coupon_applied'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_total'] = this.subTotal;
    data['tax'] = this.tax;
    data['shipping_cost'] = this.shippingCost;
    data['discount'] = this.discount;
    data['saved_amount'] = this.savedAmount;
    data['saved_amount_in_percentage'] = this.savedAmountInPercentage;
    data['club_point'] = this.clubPoint;
    data['grand_total'] = this.grandTotal;
    data['grand_total_value'] = this.grandTotalValue;
    data['coupon_code'] = this.couponCode;
    data['coupon_applied'] = this.couponApplied;
    return data;
  }
}
