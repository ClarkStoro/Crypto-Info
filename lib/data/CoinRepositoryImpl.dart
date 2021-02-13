import 'dart:async';
import 'package:crypto_info/data/ApiCoin.dart';
import 'package:crypto_info/domain/CoinRepository.dart';
import 'package:crypto_info/model/CurrencyModel.dart';
import 'package:crypto_info/model/ModelMapper.dart';

class CoinRepositoryImpl implements CoinRepository{
  ApiCoin _api = new ApiCoin();
  ModelMapper _mapper = new ModelMapper();

  @override
  Future<List<CurrencyModel>> getCurrencies() {
    return _api.fetchCurrency().then((response) {
      var products = response.data
          .map((e) => _mapper.map(e))
          .toList();
      return products;
    });
  }
}