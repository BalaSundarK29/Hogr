import 'package:flutter/material.dart';
import 'package:hogr_bala/page2_widget.dart';

class Page1Widget extends StatelessWidget {
  const Page1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: const Text(
          'Page 1',
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => Page2Widget()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey.shade600,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // button's shape
              ),
            ),
            child: const Text(
              'Page 2',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
