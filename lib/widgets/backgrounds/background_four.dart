import 'package:flutter/material.dart';

class BackgroundFour extends StatelessWidget {
  final Widget child;
  final Color color;

  const BackgroundFour({Key key, this.child, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: color,
      height:size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset('assets/eight.png',width: size.width * 0.9),
          ),
          child
        ],
      ),
    );
  }
}

