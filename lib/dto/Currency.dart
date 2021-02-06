// To parse this JSON data, do
//
//     final currency = currencyFromMap(jsonString);

import 'dart:convert';

class Currency {
  Currency({
    this.id,
    this.rank,
    this.symbol,
    this.name,
    this.supply,
    this.maxSupply,
    this.marketCapUsd,
    this.volumeUsd24Hr,
    this.priceUsd,
    this.changePercent24Hr,
    this.vwap24Hr,
    this.explorer,
  });

  String id;
  String rank;
  String symbol;
  String name;
  String supply;
  String maxSupply;
  String marketCapUsd;
  String volumeUsd24Hr;
  String priceUsd;
  String changePercent24Hr;
  String vwap24Hr;
  String explorer;

  factory Currency.fromJson(String str) => Currency.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Currency.fromMap(Map<String, dynamic> json) => Currency(
    id: json["id"],
    rank: json["rank"],
    symbol: json["symbol"],
    name: json["name"],
    supply: json["supply"],
    maxSupply: json["maxSupply"],
    marketCapUsd: json["marketCapUsd"],
    volumeUsd24Hr: json["volumeUsd24Hr"],
    priceUsd: json["priceUsd"],
    changePercent24Hr: json["changePercent24Hr"],
    vwap24Hr: json["vwap24Hr"],
    explorer: json["explorer"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "rank": rank,
    "symbol": symbol,
    "name": name,
    "supply": supply,
    "maxSupply": maxSupply,
    "marketCapUsd": marketCapUsd,
    "volumeUsd24Hr": volumeUsd24Hr,
    "priceUsd": priceUsd,
    "changePercent24Hr": changePercent24Hr,
    "vwap24Hr": vwap24Hr,
    "explorer": explorer,
  };
}
