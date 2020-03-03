import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String data;
  final Color color;

  Label(this.data, {this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(4)),
      padding: EdgeInsets.fromLTRB(2, 0.5, 2, 0.5),
      child: Text(
        data,
        style: TextStyle(
            color: color, fontSize: 10, fontWeight: FontWeight.w700),
      ),
    );
  }
}
