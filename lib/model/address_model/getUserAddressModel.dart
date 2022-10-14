class userGetAddress {
  List<Data>? data;
  bool? success;
  int? status;

  userGetAddress({this.data, this.success, this.status});

  userGetAddress.fromJson(Map<String, dynamic> json) {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
