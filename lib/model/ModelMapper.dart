
import 'package:crypto_info/data/dto/Currency.dart';
import 'package:crypto_info/domain/Mapper.dart';
import 'package:crypto_info/model/CurrencyModel.dart';



class ModelMapper implements Mapper<Currency,CurrencyModel>{

  @override
  CurrencyModel map(Currency data) {
    return new CurrencyModel(
      data.id,
      data.rank,
      data.symbol,
      data.name,
      data.supply,
      data.maxSupply,
      data.marketCapUsd,
      data.volumeUsd24Hr,
      data.priceUsd,
      data.changePercent24Hr,
      data.vwap24Hr,
      data.explorer,
      "https://static.coincap.io/assets/icons/"+data.symbol.toLowerCase()+"@2x.png"
    );
  }
}