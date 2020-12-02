import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {

  final String message;

  const ErrorBox({this.message});

  @override
  Widget build(BuildContext context) {
    if(message == null)
      return Container();
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(width: 16,),
          Expanded(
            child: Text(
              '$message',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }
}
