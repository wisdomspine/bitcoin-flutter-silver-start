//2. Import the required packages.
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  String apiKey;
  Future<double> getCoinData({@required String selectedCurrency}) async {
    if (apiKey == null) await _loadKey();
    String requestURL = '$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey';
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }

  Future<void> _loadKey() async {
    String source = await rootBundle.loadString("keys.json");
    apiKey = jsonDecode(source)["COIN_API_KEY"];
    return;
  }
}
