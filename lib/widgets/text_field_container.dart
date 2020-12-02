import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {

  final Widget child;

  const TextFieldContainer({this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.yellow.withAlpha(100),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
