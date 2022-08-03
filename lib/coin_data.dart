import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = '52D5CDD3-F71D-40C7-83EF-2AD5E23DF115';
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      http.Response response = await http.get(
          Uri.parse('$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey'));

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double rate = decodedData['rate'];
        cryptoPrices[crypto] = rate.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
  }
}
