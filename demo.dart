import "dart:io";
import "account.dart";
import 'transaction.dart';

class Bank {
  bool? status;

  final List<Account> list = [];
  Account account = Account();
  Transaction transactions = Transaction();

  void openAccount() {
    print("Enter account number to create account");
    account.accountNumber = int.parse(stdin.readLineSync()!);
    print("Enter your name");
    account.name = stdin.readLineSync()!;
    print("Enter an amount to create your account");
    account.balance = double.parse(stdin.readLineSync()!);
    account.status = true;
    print("----Account is created----");
  }

  void credit() {
    if (account.status == true) {
      double mainBalance = 0;
      if (account.balance != null) {
        mainBalance = account.balance!;
      }
      if (account.accountNumber != null && account.accountNumber != 0) {
        int accountNumber = account.accountNumber!;
        print("Your account number is $accountNumber");
      } else {
        print("enter the account number");
        account.accountNumber = int.parse(stdin.readLineSync()!);
      }
      print("enter the amount to credit");
      var amount = double.parse(stdin.readLineSync()!);
      transactions.createDate = DateTime.now();
      // transactions.amount = amount;
      account.balance = mainBalance + amount;
      // account.transactions.add(transactions);
      print(
          "Your account is credited with $amount on ${transactions.createDate} and total balance is ${account.balance}");
    } else {
      print("----Your account is closed----");
    }
  }

  void debit() {
    if (account.status == true) {
      double mainBalance = 0;
      if (account.balance != null) {
        mainBalance = account.balance!;
      }
      if (account.accountNumber != null && account.accountNumber != 0) {
        int acn = account.accountNumber!;
        print("Your account number is $acn");
      } else {
        print("enter the account number");
        account.accountNumber = int.parse(stdin.readLineSync()!);
      }

      print("enter the amount");
      var amount = double.parse(stdin.readLineSync()!);
      if (amount > account.balance!) {
        print("Insufficient Balance");
      } else {
        transactions.createDate = DateTime.now();
        // transactions.amount = amount;
        account.balance = mainBalance - amount;
        // account.transactions.add(transactions);
        print(
            "Your account is debited with $amount on ${transactions.createDate} and total balance is ${account.balance}");
      }
    } else {
      print("----Your account is closed----");
    }
  }

  void viewAccount() {
    if (account.status == true) {
      if (account.accountNumber != null && account.accountNumber != 0) {
        int accountNumber = account.accountNumber!;
        print("Account Number:  $accountNumber");
        print("Account Holder's name: ${account.name} ");
        print("Account Balance: ${account.balance}");
      } else {
        print("enter the account number");
        account.accountNumber = int.parse(stdin.readLineSync()!);
      }
      print("Enter your new name");
      account.name = stdin.readLineSync()!;
      print("----Your Profile is Updated----");
    } else {
      print("----Your account is closed----");
    }
  }

  void closeAccount() {
    account.accountNumber = 0;
    account.name = "";
    account.balance = 0;
    account.status = false;
    // transactions.amount = 0;
    print("----Your account is closed----");
  }

  // void transactionHistory() {}
}
