
class CurrencyModel {
  CurrencyModel(
    this.id,
    this.rank,
    this.symbol,
    this.name,
    this.supply,
    this.maxSupply,
    this.marketCapUsd,
    this.volumeUsd24Hr,
    this.price,
    this.changePercent24Hr,
    this.vwap24Hr,
    this.explorer,
    this.uriImg);

  String id;
  String rank;
  String symbol;
  String name;
  String supply;
  String maxSupply;
  String marketCapUsd;
  String volumeUsd24Hr;
  double price;
  double changePercent24Hr;
  String vwap24Hr;
  String explorer;
  String uriImg;

}