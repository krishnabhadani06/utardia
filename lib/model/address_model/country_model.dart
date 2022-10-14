class Country {
  int? id;
  String? code;
  String? name;
  int? status;

  Country({this.id, this.code, this.name, this.status});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['status'] = status;
    return data;
  }
}
