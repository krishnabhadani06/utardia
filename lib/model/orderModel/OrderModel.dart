class OrderModel {
  List<Data>? data;
  bool? success;
  int? status;

  OrderModel({this.data, this.success, this.status});

  OrderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  List<ShippingAddress>? shippingAddress;
  String? paymentStatus;
  String? deliveryStatus;
  String? code;
  int? couponDiscount;
  int? grandTotal;
  List<ProductDetail>? productDetail;

  Data(
      {this.id,
      this.shippingAddress,
      this.paymentStatus,
      this.deliveryStatus,
      this.code,
      this.couponDiscount,
      this.grandTotal,
      this.productDetail});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['shipping_address'] != null) {
      shippingAddress = <ShippingAddress>[];
      json['shipping_address'].forEach((v) {
        shippingAddress!.add(new ShippingAddress.fromJson(v));
      });
    }
    paymentStatus = json['payment_status'];
    deliveryStatus = json['delivery_status'];
    code = json['code'];
    couponDiscount = json['coupon_discount'];
    grandTotal = json['grand_total'];
    if (json['product_detail'] != null) {
      productDetail = <ProductDetail>[];
      json['product_detail'].forEach((v) {
        productDetail!.add(new ProductDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.shippingAddress != null) {
      data['shipping_address'] =
          this.shippingAddress!.map((v) => v.toJson()).toList();
    }
    data['payment_status'] = this.paymentStatus;
    data['delivery_status'] = this.deliveryStatus;
    data['code'] = this.code;
    data['coupon_discount'] = this.couponDiscount;
    data['grand_total'] = this.grandTotal;
    if (this.productDetail != null) {
      data['product_detail'] =
          this.productDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShippingAddress {
  String? name;
  String? email;
  String? address;
  String? country;
  String? state;
  String? city;
  String? postalCode;
  String? phone;

  ShippingAddress(
      {this.name,
      this.email,
      this.address,
      this.country,
      this.state,
      this.city,
      this.postalCode,
      this.phone});

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    address = json['address'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    postalCode = json['postal_code'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['postal_code'] = this.postalCode;
    data['phone'] = this.phone;
    return data;
  }
}

class ProductDetail {
  int? id;
  String? title;
  List<Photos>? photos;
  int? rating;
  String? thumbnailImage;
  String? discountType;
  int? discount;
  bool? hasDiscount;
  String? strokedPrice;
  String? priceHighLow;
  List<ChoiceOptions>? choiceOptions;
  List<String>? colors;
  List<Choices>? choices;
  List<String>? tags;
  Links? links;

  ProductDetail(
      {this.id,
      this.title,
      this.photos,
      this.rating,
      this.thumbnailImage,
      this.discountType,
      this.discount,
      this.hasDiscount,
      this.strokedPrice,
      this.priceHighLow,
      this.choiceOptions,
      this.colors,
      this.choices,
      this.tags,
      this.links});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(new Photos.fromJson(v));
      });
    }
    rating = json['rating'];
    thumbnailImage = json['thumbnail_image'];
    discountType = json['discount_type'];
    discount = json['discount'];
    hasDiscount = json['has_discount'];
    strokedPrice = json['stroked_price'];
    priceHighLow = json['price_high_low'];
    if (json['choice_options'] != null) {
      choiceOptions = <ChoiceOptions>[];
      json['choice_options'].forEach((v) {
        choiceOptions!.add(new ChoiceOptions.fromJson(v));
      });
    }
    colors = json['colors'].cast<String>();
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add(new Choices.fromJson(v));
      });
    }
    tags = json['tags'].cast<String>();
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    data['rating'] = this.rating;
    data['thumbnail_image'] = this.thumbnailImage;
    data['discount_type'] = this.discountType;
    data['discount'] = this.discount;
    data['has_discount'] = this.hasDiscount;
    data['stroked_price'] = this.strokedPrice;
    data['price_high_low'] = this.priceHighLow;
    if (this.choiceOptions != null) {
      data['choice_options'] =
          this.choiceOptions!.map((v) => v.toJson()).toList();
    }
    data['colors'] = this.colors;
    if (this.choices != null) {
      data['choices'] = this.choices!.map((v) => v.toJson()).toList();
    }
    data['tags'] = this.tags;
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    return data;
  }
}

class Photos {
  String? variant;
  String? path;

  Photos({this.variant, this.path});

  Photos.fromJson(Map<String, dynamic> json) {
    variant = json['variant'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variant'] = this.variant;
    data['path'] = this.path;
    return data;
  }
}

class ChoiceOptions {
  String? name;
  String? title;
  List<String>? options;

  ChoiceOptions({this.name, this.title, this.options});

  ChoiceOptions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    data['options'] = this.options;
    return data;
  }
}

class Choices {
  String? variant;
  String? sku;
  int? price;
  String? color;
  String? option;
  int? qty;
  String? image;

  Choices(
      {this.variant,
      this.sku,
      this.price,
      this.color,
      this.option,
      this.qty,
      this.image});

  Choices.fromJson(Map<String, dynamic> json) {
    variant = json['variant'];
    sku = json['sku'];
    price = json['price'];
    color = json['color'];
    option = json['option'];
    qty = json['qty'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variant'] = this.variant;
    data['sku'] = this.sku;
    data['price'] = this.price;
    data['color'] = this.color;
    data['option'] = this.option;
    data['qty'] = this.qty;
    data['image'] = this.image;
    return data;
  }
}

class Links {
  String? details;

  Links({this.details});

  Links.fromJson(Map<String, dynamic> json) {
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['details'] = this.details;
    return data;
  }
}
