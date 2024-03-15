import 'package:flutter/material.dart';
import 'package:flutter_application_task3/controllers/task_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ComputersScreen extends StatelessWidget {
  final LoanController controller = Get.put(LoanController());

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
                onTap: () {
  
                },
              );
            },
          )),
    );
  }
}