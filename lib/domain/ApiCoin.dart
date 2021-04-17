import 'package:crypto_info/data/dto/CurrencyResponse.dart';
import 'package:crypto_info/data/dto/HistoryResponse.dart';

abstract class ApiCoin {
  Future<CurrencyResponse> fetchCurrency();

  Future<HistoryResponse> fetchHistory(String id, String interval, int? start, int? end);
}