import 'package:crypto_info/data/dto/CurrencyResponse.dart';
import 'package:crypto_info/data/dto/HistoryResponse.dart';
import 'package:crypto_info/domain/ApiCoin.dart';
import 'package:http/http.dart' as http;

class ApiCoinImpl implements ApiCoin {

  static const _BASE_URL = "https://api.coincap.io/v2/assets/";


  @override
  Future<CurrencyResponse> fetchCurrency() async {
    final response = await http.get(Uri.parse(_BASE_URL));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      CurrencyResponse res = CurrencyResponse.fromJson(response.body);
      return res;

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw NetworkException(response.body);
    }
  }

  @override
  Future<HistoryResponse> fetchHistory(int id, String interval, int? start, int? end) async {
    final response = await http.get(Uri.parse(_BASE_URL+"/$id/history?interval=$interval"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      HistoryResponse res = HistoryResponse.fromJson(response.body);
      return res;

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw NetworkException(response.body);
    }
  }
}


class NetworkException implements Exception{
  final String? error;
  const NetworkException(this.error);

  @override
  String toString() => error ?? "";
}