import "dart:io";

import "demo.dart";
import "account.dart";
import 'transaction.dart';

void main() {
  bool? status;

  Bank bank = Bank();
  Account account = Account();

  status = true;
  bool user = true;
  while (user) {
    print(
        "1. Create \n 2. credit \n 3. Debit \n 4. View and Edit  \n 5. Close the account \n 6. Exit ");
    print("please select any option");
    final input = stdin.readLineSync();
    if (input == null || input.isEmpty) {
      throw Exception("invalid");
    }
    int? option = int?.parse(input);

    if (option == 1) {
      bank.openAccount();
    } else if (option == 2) {
      bank.credit();
    } else if (option == 3) {
      bank.debit();
    } else if (option == 4) {
      bank.viewAccount();
    } else if (option == 5) {
      bank.closeAccount();
    } else if (option == 6) {
      print("Exit");
      break;
    } else {
      print("invalid option");
    }
  }
}
