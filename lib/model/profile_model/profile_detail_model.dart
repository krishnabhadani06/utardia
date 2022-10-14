class ProfileModel {
  List<Data>? data;
  bool? success;
  int? status;

  ProfileModel({this.data, this.success, this.status});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? type;
  String? email;
  String? avatar;
  String? avatarOriginal;
  Address? address;
  String? city;
  String? country;
  String? postalCode;
  String? phone;

  Data(
      {this.id,
      this.name,
      this.type,
      this.email,
      this.avatar,
      this.avatarOriginal,
      this.address,
      this.city,
      this.country,
      this.postalCode,
      this.phone});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    email = json['email'];
    avatar = json['avatar'];
    avatarOriginal = json['avatar_original'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    city = json['city'];
    country = json['country'];
    postalCode = json['postal_code'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['email'] = email;
    data['avatar'] = avatar;
    data['avatar_original'] = avatarOriginal;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['city'] = city;
    data['country'] = country;
    data['postal_code'] = postalCode;
    data['phone'] = phone;
    return data;
  }
}

class Address {
  List<Data2>? data;

  Address({this.data});

  Address.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data2>[];
      json['data'].forEach((v) {
        data!.add(Data2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data2 {
  int? id;
  int? userId;
  String? address;
  int? countryId;
  int? stateId;
  int? cityId;
  String? countryName;
  String? stateName;
  String? cityName;
  String? postalCode;
  String? workType;
  String? phone;
  int? setDefault;
  bool? locationAvailable;
  double? lat;
  double? lang;

  Data2(
      {this.id,
      this.userId,
      this.address,
      this.countryId,
      this.stateId,
      this.cityId,
      this.countryName,
      this.stateName,
      this.cityName,
      this.postalCode,
      this.workType,
      this.phone,
      this.setDefault,
      this.locationAvailable,
      this.lat,
      this.lang});

  Data2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    address = json['address'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    countryName = json['country_name'];
    stateName = json['state_name'];
    cityName = json['city_name'];
    postalCode = json['postal_code'];
    workType = json['work_type'];
    phone = json['phone'];
    setDefault = json['set_default'];
    locationAvailable = json['location_available'];
    lat = json['lat'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['address'] = address;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['country_name'] = countryName;
    data['state_name'] = stateName;
    data['city_name'] = cityName;
    data['postal_code'] = postalCode;
    data['work_type'] = workType;
    data['phone'] = phone;
    data['set_default'] = setDefault;
    data['location_available'] = locationAvailable;
    data['lat'] = lat;
    data['lang'] = lang;
    return data;
  }
}
