import 'package:flutter/material.dart';

class Page4Widget extends StatelessWidget {
  List<String> listItems;
  Page4Widget({required this.listItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Text(listItems[index],
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600));
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: listItems.length),
    );
  }
}
