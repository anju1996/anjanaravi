import "dart:io";
import "account.dart";
import 'transaction.dart';

class Bank {
  // bool? status;

  final List<Account> list = [];
  Account account = Account();
  Transaction transaction = Transaction();
  // var transactionList = [];

  void openAccount() {
    print("Enter account number to create account");
    account.accountNumber = int.parse(stdin.readLineSync()!);
    print("Enter your name");
    account.name = stdin.readLineSync()!;
    print("Enter an amount to create your account");
    account.balance = double.parse(stdin.readLineSync()!);
    transaction.createDate = DateTime.now();
    transaction.amount = account.balance;
    transaction.type = "credit";
    account.transactions.add(transaction);
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
      transaction.createDate = DateTime.now();
      transaction.amount = amount;
      transaction.type = "credit";

      account.transactions.add(transaction);
      account.balance = mainBalance + amount;

      print(
          "Your account is credited with $amount on ${transaction.createDate} and total balance is ${account.balance}");
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
        int accountNumber = account.accountNumber!;
        print("Your account number is $accountNumber");
      } else {
        print("enter the account number");
        account.accountNumber = int.parse(stdin.readLineSync()!);
      }

      print("enter the amount");
      var amount = double.parse(stdin.readLineSync()!);
      if (amount > account.balance!) {
        print("Insufficient Balance");
      } else {
        transaction.createDate = DateTime.now();
        transaction.amount = amount;
        transaction.type = "debit";
        account.transactions.add(transaction);
        account.balance = mainBalance - amount;

        print(
            "Your account is debited with $amount on ${transaction.createDate} and total balance is ${account.balance}");
      }
    } else {
      print("----Your account is closed----");
    }
  }

  // void viewTransactionHistory() {
  //   print("your transactions : \n");
  //   for (var item in account.transactions) {
  //     String type = (item.type == credit ? "+" : "-");
  //     print("${type}  ${item.amount}  \n");
  //   }
  void viewTransactionHistory() {
    print("your transactions : \n");
    for (var item in account.transactions) {
      if (transaction.type == "credit") {
        print(
            "${transaction.type} -- ${transaction.amount} -- ${transaction.createDate}");
      } else {
        print(
            "${transaction.type} -- ${transaction.amount} -- ${transaction.createDate}");
      }
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
      //   print("Enter your new name");
      //   account.name = stdin.readLineSync()!;
      //   print("----Your Profile is Updated----");
    } else {
      print("----Your account is closed----");
    }
  }

  void closeAccount() {
    account.accountNumber = 0;
    account.name = "";
    account.balance = 0;
    // status = false;
    // transactions.amount = 0;
    print("----Your account is closed----");
  }

  // void transactionHistory() {}
}
