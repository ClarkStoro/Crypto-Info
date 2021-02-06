// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromMap(jsonString);

import 'dart:convert';
import 'package:crypto_info/dto/Currency.dart';

class ApiResponse {
  ApiResponse({
    this.data,
    this.timestamp,
  });

  List<Currency> data;
  int timestamp;

  factory ApiResponse.fromJson(String str) => ApiResponse.fromMap(json.decode(str));

  factory ApiResponse.fromMap(Map<String, dynamic> json) => ApiResponse(
    data: List<Currency>.from(json["data"].map((x) => Currency.fromJson(x))),
    timestamp: json["timestamp"],
  );

}
