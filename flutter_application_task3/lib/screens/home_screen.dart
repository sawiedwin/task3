import 'package:flutter/material.dart';
import 'package:flutter_application_task3/controllers/task_controller.dart';
import 'package:flutter_application_task3/models/task.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ComputersScreen extends StatelessWidget {
  final LoanController controller = Get.put(LoanController());

  ComputersScreen({Key? key}) : super(key: key);

  void _showLoanDialog(BuildContext context, Computer computer) {
    final TextEditingController userNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registrar Préstamo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Estás a punto de solicitar un préstamo para la computadora: ${computer.name}.'),
              SizedBox(height: 20),
              TextField(
                controller: userNameController,
                decoration: InputDecoration(hintText: "Ingresa tu nombre"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirmar'),
              onPressed: () {
                if (userNameController.text.isNotEmpty) {
                  controller.addLoan(computer.id, userNameController.text);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Computadoras Disponibles'),
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.computers.where((c) => c.isAvailable).length,
            itemBuilder: (context, index) {
              final computer = controller.computers.where((c) => c.isAvailable).toList()[index];
              return ListTile(
                title: Text(computer.name),
                onTap: () => _showLoanDialog(context, computer),
              );
            },
          )),
    );
  }
}
