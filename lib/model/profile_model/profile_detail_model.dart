// class profileModel {
//   List<Data>? data;
//   bool? success;
//   int? status;

//   profileModel({this.data, this.success, this.status});

//   profileModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//     success = json['success'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['success'] = this.success;
//     data['status'] = this.status;
//     return data;
//   }
// }

// class Data {
//   int? id;
//   String? name;
//   String? type;
//   String? email;
//   Null? avatar;
//   String? avatarOriginal;
//   Address? address;
//   String? city;
//   String? country;
//   String? postalCode;
//   String? phone;

//   Data(
//       {this.id,
//       this.name,
//       this.type,
//       this.email,
//       this.avatar,
//       this.avatarOriginal,
//       this.address,
//       this.city,
//       this.country,
//       this.postalCode,
//       this.phone});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     type = json['type'];
//     email = json['email'];
//     avatar = json['avatar'];
//     avatarOriginal = json['avatar_original'];
//     address =
//         json['address'] != null ? Address.fromJson(json['address']) : null;
//     city = json['city'];
//     country = json['country'];
//     postalCode = json['postal_code'];
//     phone = json['phone'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['type'] = this.type;
//     data['email'] = this.email;
//     data['avatar'] = this.avatar;
//     data['avatar_original'] = this.avatarOriginal;
//     if (this.address != null) {
//       data['address'] = this.address!.toJson();
//     }
//     data['city'] = this.city;
//     data['country'] = this.country;
//     data['postal_code'] = this.postalCode;
//     data['phone'] = this.phone;
//     return data;
//   }
// }

// class Address {
//   List<Data>? data;

//   Address({this.data});

//   Address.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Data1 {
//   int? id;
//   int? userId;
//   String? address;
//   int? countryId;
//   int? stateId;
//   int? cityId;
//   String? countryName;
//   String? stateName;
//   String? cityName;
//   String? postalCode;
//   String? workType;
//   String? phone;
//   int? setDefault;
//   bool? locationAvailable;
//   double? lat;
//   double? lang;

//   Data1(
//       {this.id,
//       this.userId,
//       this.address,
//       this.countryId,
//       this.stateId,
//       this.cityId,
//       this.countryName,
//       this.stateName,
//       this.cityName,
//       this.postalCode,
//       this.workType,
//       this.phone,
//       this.setDefault,
//       this.locationAvailable,
//       this.lat,
//       this.lang});

//   Data1.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     address = json['address'];
//     countryId = json['country_id'];
//     stateId = json['state_id'];
//     cityId = json['city_id'];
//     countryName = json['country_name'];
//     stateName = json['state_name'];
//     cityName = json['city_name'];
//     postalCode = json['postal_code'];
//     workType = json['work_type'];
//     phone = json['phone'];
//     setDefault = json['set_default'];
//     locationAvailable = json['location_available'];
//     lat = json['lat'];
//     lang = json['lang'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['address'] = this.address;
//     data['country_id'] = this.countryId;
//     data['state_id'] = this.stateId;
//     data['city_id'] = this.cityId;
//     data['country_name'] = this.countryName;
//     data['state_name'] = this.stateName;
//     data['city_name'] = this.cityName;
//     data['postal_code'] = this.postalCode;
//     data['work_type'] = this.workType;
//     data['phone'] = this.phone;
//     data['set_default'] = this.setDefault;
//     data['location_available'] = this.locationAvailable;
//     data['lat'] = this.lat;
//     data['lang'] = this.lang;
//     return data;
//   }
// }
class ProfileModel {
  List<Data>? data;
  bool? success;
  int? status;

  ProfileModel({this.data, this.success, this.status});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? type;
  String? email;
  Null? avatar;
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
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    city = json['city'];
    country = json['country'];
    postalCode = json['postal_code'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['avatar_original'] = this.avatarOriginal;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['city'] = this.city;
    data['country'] = this.country;
    data['postal_code'] = this.postalCode;
    data['phone'] = this.phone;
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
        data!.add(new Data2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['address'] = this.address;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['country_name'] = this.countryName;
    data['state_name'] = this.stateName;
    data['city_name'] = this.cityName;
    data['postal_code'] = this.postalCode;
    data['work_type'] = this.workType;
    data['phone'] = this.phone;
    data['set_default'] = this.setDefault;
    data['location_available'] = this.locationAvailable;
    data['lat'] = this.lat;
    data['lang'] = this.lang;
    return data;
  }
}
