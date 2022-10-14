class OrderModel {
  List<Data>? data;
  bool? success;
  int? status;

  OrderModel({this.data, this.success, this.status});

  OrderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = success;
    data['status'] = status;
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
        shippingAddress!.add(ShippingAddress.fromJson(v));
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
        productDetail!.add(ProductDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (shippingAddress != null) {
      data['shipping_address'] =
          shippingAddress!.map((v) => v.toJson()).toList();
    }
    data['payment_status'] = paymentStatus;
    data['delivery_status'] = deliveryStatus;
    data['code'] = code;
    data['coupon_discount'] = couponDiscount;
    data['grand_total'] = grandTotal;
    if (productDetail != null) {
      data['product_detail'] = productDetail!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['address'] = address;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['postal_code'] = postalCode;
    data['phone'] = phone;
    return data;
  }
}

class ProductDetail {
  int? id;
  String? productName;
  String? productCategory;
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
  String? date;
  Links? links;

  ProductDetail(
      {this.id,
      this.productName,
      this.productCategory,
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
      this.date,
      this.links});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productCategory = json['product_category'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
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
        choiceOptions!.add(ChoiceOptions.fromJson(v));
      });
    }
    colors = json['colors'].cast<String>();
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add(Choices.fromJson(v));
      });
    }
    tags = json['tags'].cast<String>();
    date = json['date'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_name'] = productName;
    data['product_category'] = productCategory;
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    data['rating'] = rating;
    data['thumbnail_image'] = thumbnailImage;
    data['discount_type'] = discountType;
    data['discount'] = discount;
    data['has_discount'] = hasDiscount;
    data['stroked_price'] = strokedPrice;
    data['price_high_low'] = priceHighLow;
    if (choiceOptions != null) {
      data['choice_options'] = choiceOptions!.map((v) => v.toJson()).toList();
    }
    data['colors'] = colors;
    if (choices != null) {
      data['choices'] = choices!.map((v) => v.toJson()).toList();
    }
    data['tags'] = tags;
    data['date'] = date;
    if (links != null) {
      data['links'] = links!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['variant'] = variant;
    data['path'] = path;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['title'] = title;
    data['options'] = options;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['variant'] = variant;
    data['sku'] = sku;
    data['price'] = price;
    data['color'] = color;
    data['option'] = option;
    data['qty'] = qty;
    data['image'] = image;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['details'] = details;
    return data;
  }
}
