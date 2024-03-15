// lib/model.dart o lib/models/model.dart, dependiendo de dónde quieras colocarlo

class Computer {
  int id;
  String name;
  bool isAvailable;

  Computer({required this.id, required this.name, this.isAvailable = true});
}

class Loan {
  int id;
  int computerId;
  String userName;
  DateTime loanDate;
  DateTime? returnDate;

  Loan({required this.id, required this.computerId, required this.userName, required this.loanDate, this.returnDate});
}
