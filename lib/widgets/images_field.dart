import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:found_and_lost_app/store_controllers/create_item_store.dart';
import 'package:found_and_lost_app/widgets/image_infos.dart';
import 'package:found_and_lost_app/widgets/image_search_dialog.dart';

class ImagesField extends StatelessWidget {

  final CreateStore createStore;

  const ImagesField(this.createStore);

  @override
  Widget build(BuildContext context) {

    void onImageSelected(File image) {
      createStore.images.add(image);
      Navigator.of(context).pop();
    }

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5, left: 18, right: 10),
          color: Colors.transparent,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Observer(
            builder: (_){
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:  createStore.images.length < 5 ? createStore.images.length + 1 : 5,
                itemBuilder: (_, index) {
                  if(index == createStore.images.length)
                   return Padding(
                     padding: EdgeInsets.fromLTRB(10, 8, 0, 8),
                     child: GestureDetector(
                       onTap: () {
                         showCupertinoModalPopup(
                          context: context,
                          builder: (_) => ImageDialog(onImageSelected),
                        );
                      },
                      child: CircleAvatar(
                        radius: 44,
                        backgroundColor: Colors.yellow.withAlpha(100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt_rounded,
                              size: 40,
                              color: Colors.grey.withAlpha(100),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                  else
                    return Padding(
                      padding: EdgeInsets.fromLTRB(10, 8, 0, 8),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(context: context, builder: (_) => ImageInfos(
                            image: createStore.images[index],
                            onDelete: () => createStore.images.removeAt(index),
                          )
                          );
                        },
                        child: CircleAvatar(
                          radius: 44,
                          backgroundImage: FileImage(
                              createStore.images[index],
                          ),
                        ),
                      ),
                    );
                },
              );
            },
          ),
        ),
        Observer(
          builder: (_){
            if(createStore.imagesError != null)
              return Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.fromLTRB(16,8,10,8),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.red)
                    )
                ),
                child: Text(
                  createStore.imagesError,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 12
                  ),
                ),
              );
            else
              return Container();
          },
        ),
      ],
    );
  }
}
