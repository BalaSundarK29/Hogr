import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hogr_bala/controller/dashboard_controller.dart';

class Page3Widget extends StatelessWidget {
  Page3Widget({super.key});
  final controller = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            controller.updatePageIndex(4);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey.shade600,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // button's shape
            ),
          ),
          child: const Text('Page 4'),
        ),
      ),
    );
  }
}
