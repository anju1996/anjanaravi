import "dart:io";
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<double> fetchConverter(
    String source, String destination, double value) async {
  http.Response response = await http.get((Uri.parse(
      'https://v6.exchangerate-api.com/v6/bb5e35fabdf312c7b8e67e8f/pair/${source.toUpperCase()}/${destination.toUpperCase()}/$value')));

  // print(response.body);
  if (response.statusCode == 200) {
    var list = jsonDecode(response.body);
    var result = list['conversion_result'];
    // print("The conversion result is $result ${destination.toUpperCase()}");
    return result;
  } else {
    throw Exception('Unable to load');
  }
}

void main() async {
  print("Select the first currency:");

  String? source = stdin.readLineSync();

  if (source == null || source.isEmpty) {
    throw Exception("Enter a valid value");
  }

  print("Select the second currency:");

  String? destination = stdin.readLineSync();

  if (destination == null || destination.isEmpty) {
    throw Exception("Enter a valid value");
  }

  print("Enter the amount");

  var amount = stdin.readLineSync();

  if (amount == null || amount.isEmpty) {
    throw Exception("enter a valid input");
  }

  double? value = double?.tryParse(amount);
  if (value == null) {
    throw Exception("Enter a valid input");
  }

  final newAmount = await fetchConverter(source, destination, value);
  print(
      "$value ${source.toUpperCase()} is converted to $newAmount ${destination.toUpperCase()}");
}
