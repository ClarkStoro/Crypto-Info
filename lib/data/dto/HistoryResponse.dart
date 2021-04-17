import 'dart:convert';

class HistoryResponse {
  HistoryResponse({
    required this.data,
  });

  List<HistoryDto>? data;

  factory HistoryResponse.fromJson(String str) => HistoryResponse.fromMap(json.decode(str));

  factory HistoryResponse.fromMap(Map<String, dynamic> jsonMap) => HistoryResponse(
    data: List<HistoryDto>.from(jsonMap["data"].map((x) => HistoryDto.fromMap(x)))
  );

}

class HistoryDto {
  String priceUsd;
  int time;

  HistoryDto({
    required this.priceUsd,
    required this.time,
  });

  factory HistoryDto.fromJson(String str) => HistoryDto.fromMap(json.decode(str));

  factory HistoryDto.fromMap(Map<String, dynamic> json) => HistoryDto(
    priceUsd: json["priceUsd"],
    time: json["time"]);

}