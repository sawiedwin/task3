import 'package:flutter_application_task3/models/task.dart';
import 'package:get/get.dart';
import 'models.dart';

class LoanController extends GetxController {
  var computers = <Computer>[].obs;
  var loans = <Loan>[].obs;

  @override
  void onInit() {
    super.onInit();
  
  }

  void addLoan(int computerId, String userName) {
    final computer = computers.firstWhere((item) => item.id == computerId);
    if (computer.isAvailable) {
      computer.isAvailable = false;
      loans.add(Loan(
        id: loans.length + 1,
        computerId: computerId,
        userName: userName,
        loanDate: DateTime.now(),
      ));
      computers.refresh();
    }
  }

  void returnComputer(int loanId) {
    final loan = loans.firstWhere((loan) => loan.id == loanId);
    final computer = computers.firstWhere((computer) => computer.id == loan.computerId);
    computer.isAvailable = true;
    loan.returnDate = DateTime.now();
    computers.refresh();
  }
}