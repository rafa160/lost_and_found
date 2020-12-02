import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:found_and_lost_app/helpers/strings.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageDialog extends StatelessWidget {

  final Function(File) onImageSelected;

  const ImageDialog(this.onImageSelected);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: const Text(Strings.DIALOG_TITLE),
      cancelButton: CupertinoActionSheetAction(
          onPressed: Navigator.of(context).pop,
          child: Text(Strings.CANCEL_BUTTON, style: TextStyle(color: Colors.red),)
      ),
      actions: [
        CupertinoActionSheetAction(
            onPressed: getFromCamera,
            child:  Text(Strings.CAMERA_BUTTON,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
        ),
        CupertinoActionSheetAction(
            onPressed: getFromGallery,
            child:  Text(Strings.GALLERY_BUTTON,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
        ),
      ],
    );
  }

  Future<void> getFromCamera() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    if(pickedFile == null) return;
    imageSelected(File(pickedFile.path));
  }

  Future<void> getFromGallery() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if(pickedFile == null) return;
    imageSelected(File(pickedFile.path));
  }

  Future<void> imageSelected(File image) async {
   final croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX: 1,ratioY: 1),
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: Strings.EDIT_IMAGE_BUTTON,
        toolbarColor: Colors.yellow,
        toolbarWidgetColor: Colors.black
      ),
      iosUiSettings: IOSUiSettings(
        title: Strings.EDIT_IMAGE_BUTTON,
        cancelButtonTitle: Strings.CANCEL_BUTTON,
        doneButtonTitle: Strings.FINISH_BUTTON
      ),
    );
   if(croppedFile == null) return;
    onImageSelected(croppedFile);
  }
}
