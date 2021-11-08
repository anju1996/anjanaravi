import 'transaction.dart';

class Account {
  int? accountNumber;
  String? name;
  double? balance;
  bool? status;
  List<Transaction> transactions = [];

  Account({this.accountNumber, this.name, this.status});
}
