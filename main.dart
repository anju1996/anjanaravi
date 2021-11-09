import "dart:io";

import "demo1.dart";
import "account.dart";
import 'transaction.dart';

void main() {
  Bank bank = Bank();
  // Account account = Account();

  // account.status = true;
  bool user = true;
  while (user) {
    print(
        "1. Create \n 2. View an existing account \n 3. Close your account \n 4. Exit");
    print("please select any option");
    final mainInput = stdin.readLineSync();
    if (mainInput == null || mainInput.isEmpty) {
      throw Exception("invalid");
    }
    int? mainOption = int?.parse(mainInput);
    if (mainOption == 1) {
      bank.openAccount();
    } else if (mainOption == 2) {
      bank.viewAccount();
      print("1. credit \n 2. Debit  \n 3. Transaction History \n 4. Exit");
      print("please select any option");
      final input = stdin.readLineSync();
      if (input == null || input.isEmpty) {
        throw Exception("invalid");
      }
      int? option = int?.parse(input);
      if (option == 1) {
        bank.credit();
      } else if (option == 2) {
        bank.debit();
      } else if (option == 3) {
        bank.viewTransactionHistory();
      } else if (option == 4) {
        print("Exit");
        break;
      } else {
        print("invalid option");
      }
    } else if (mainOption == 3) {
      bank.closeAccount();
    } else if (mainOption == 4) {
      print("Exit");
      break;
    } else {
      print("invalid option");
    }
  }
}
