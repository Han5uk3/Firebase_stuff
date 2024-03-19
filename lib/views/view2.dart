import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:untitled2/controllers/cnrt.dart';

class cntr extends StatelessWidget {
  const cntr({super.key});

  @override
  Widget build(BuildContext context) {
    final control c = Get.put(control());
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text("Clicker (${c.count})"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                onPressed: () {
                  c.increment();
                },
                child: const Text(
                  "- CLICK ME -",
                  style: TextStyle(color: Colors.white),
                )),

          ],
        ),
      ),
    );
  }
}
