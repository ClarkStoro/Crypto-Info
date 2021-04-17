import 'package:crypto_info/model/CurrencyModel.dart';
import 'package:crypto_info/model/HistoryModel.dart';

abstract class CoinRepository{

  Future<List<CurrencyModel>> getCurrencies();

  Future<List<HistoryModel>> getHistory(String id, String interval, int? start, int? end);

}