import 'package:crypto_info/domain/ApiCoin.dart';
import 'package:http/http.dart' as http;
import 'dto/CoinCapResponse.dart';

class ApiCoinImpl implements ApiCoin {

  @override
  Future<CoinCapResponse> fetchCurrency() async {
    final response = await http.get(Uri.parse('https://api.coincap.io/v2/assets/'));

    //throw Exception('My test exception!');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      CoinCapResponse res = CoinCapResponse.fromJson(response.body);
      return res;

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}