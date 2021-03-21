import 'package:crypto_info/domain/Mapper.dart';
import 'package:crypto_info/model/CurrencyModel.dart';
import 'package:crypto_info/model/ModelMapper.dart';
import 'package:crypto_info/presentation/CurrencyUi.dart';

class UiMapper extends Mapper<CurrencyModel,CurrencyUi>{
  @override
  CurrencyUi map(CurrencyModel data) {
    return new CurrencyUi(data.id,
        data.rank,
        data.symbol,
        data.name,
        data.supply,
        data.maxSupply,
        data.marketCapUsd,
        data.volumeUsd24Hr,
        data.price.toStringAsFixed(2),
        data.changePercent24Hr.toStringAsFixed(2)+"%",
        data.vwap24Hr,
        data.explorer,
        data.uriImg,
        data.changePercent24Hr<0
    );
  }
}