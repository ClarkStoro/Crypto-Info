// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromMap(jsonString);

import 'dart:convert';

import 'Currency.dart';

class CoinCapResponse {
  CoinCapResponse({
    this.data,
    this.timestamp,
  });

  List<Currency> data;
  int timestamp;

  factory CoinCapResponse.fromJson(String str) => CoinCapResponse.fromMap(json.decode(str));

  factory CoinCapResponse.fromMap(Map<String, dynamic> jsonMap) => CoinCapResponse(
    data: List<Currency>.from(jsonMap["data"].map((x) => Currency.fromMap(x))),
    timestamp: jsonMap["timestamp"],
  );

}
