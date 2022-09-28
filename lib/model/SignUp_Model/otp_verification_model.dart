// To parse this JSON data, do
//
//     final otpVerification = otpVerificationFromJson(jsonString);

import 'dart:convert';

OtpVerification otpVerificationFromJson(String str) => OtpVerification.fromJson(json.decode(str));

String otpVerificationToJson(OtpVerification data) => json.encode(data.toJson());

class OtpVerification {
  OtpVerification({
    this.result,
    this.message,
  });

  bool? result;
  String? message;

  factory OtpVerification.fromJson(Map<String, dynamic> json) => OtpVerification(
    result: json["result"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
  };
}
