import "dart:io";
import 'package:http/http.dart' as http;

//cTo is converted to currency
//cFrom is converted from currency

Future<void> fetchConverter(String cFrom, String cTo, double value) async {
  var response = await http.get((Uri.parse(
      'https://v6.exchangerate-api.com/v6/bb5e35fabdf312c7b8e67e8f/pair/${cFrom.toUpperCase()}/${cTo.toUpperCase()}/$value')));

  print(response.body);
}

void main() async {
  print("Select the first currency:");
  String? cFrom = stdin.readLineSync();

  if (cFrom == null || cFrom.isEmpty) {
    throw Exception("Enter a valid value");
  }

  print("Select the second currency:");
  String? cTo = stdin.readLineSync();

  if (cTo == null || cTo.isEmpty) {
    throw Exception("Enter a valid value");
  }

  print("Enter the amount");
  var amount = stdin.readLineSync();

  if (amount == null || amount.isEmpty) {
    throw Exception("enter a valid input");
  }

  double? value = double?.parse(amount);

  final newAmount = await fetchConverter(cFrom, cTo, value);
}
