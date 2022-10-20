class reviewModel {
  int? userId;
  String? userName;
  String? avatar;
  int? rating;
  String? comment;
  String? time;

  reviewModel(
      {this.userId,
      this.userName,
      this.avatar,
      this.rating,
      this.comment,
      this.time});

  reviewModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    avatar = json['avatar'];
    rating = json['rating'];
    comment = json['comment'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['avatar'] = this.avatar;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['time'] = this.time;
    return data;
  }
}
