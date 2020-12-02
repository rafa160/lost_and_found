import 'package:flutter/material.dart';
import 'package:found_and_lost_app/helpers/strings.dart';

class ImageInfos extends StatelessWidget {

  ImageInfos({@required this.image, @required this.onDelete});

  final dynamic image;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.file(image),
          FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
                onDelete();
              },
              child: Text(Strings.DELETE),
            textColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
