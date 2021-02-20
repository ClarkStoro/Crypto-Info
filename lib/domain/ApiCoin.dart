import 'package:crypto_info/data/dto/CoinCapResponse.dart';

abstract class ApiCoin {
  Future<CoinCapResponse> fetchCurrency();
}