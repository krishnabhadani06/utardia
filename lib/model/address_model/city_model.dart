class CityModel {
  int? id;
  int? stateId;
  String? name;
  int? cost;

  CityModel({this.id, this.stateId, this.name, this.cost});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stateId = json['state_id'];
    name = json['name'];
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['state_id'] = stateId;
    data['name'] = name;
    data['cost'] = cost;
    return data;
  }
}
