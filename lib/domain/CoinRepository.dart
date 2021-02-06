import 'package:crypto_info/model/CurrencyModel.dart';

abstract class CoinRepository{

  Future<List<CurrencyModel>> getCurrencies();

}