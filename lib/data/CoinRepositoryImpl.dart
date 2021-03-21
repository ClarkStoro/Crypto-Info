import 'dart:async';
import 'package:crypto_info/data/dto/Currency.dart';
import 'package:crypto_info/domain/ApiCoin.dart';
import 'package:crypto_info/domain/CoinRepository.dart';
import 'package:crypto_info/model/CurrencyModel.dart';
import 'package:crypto_info/model/ModelMapper.dart';

class CoinRepositoryImpl implements CoinRepository{
  final ApiCoin api;
  ModelMapper _mapper = new ModelMapper();

  CoinRepositoryImpl(this.api);

  @override
  Future<List<CurrencyModel>> getCurrencies() {
    return api.fetchCurrency().then((response) {
      List<Currency>? data = response.data;
      List<CurrencyModel> resp = [];
      if(data!=null){
        resp = data.map((Currency e) => _mapper.map(e)).toList();
      }
      return resp;
    });
  }
}