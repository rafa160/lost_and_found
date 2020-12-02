import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:found_and_lost_app/store_controllers/create_item_store.dart';
import 'package:found_and_lost_app/widgets/text_field_container.dart';

class HideFields extends StatelessWidget {

  final CreateStore createStore;

  const HideFields({this.createStore});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
      child: TextFieldContainer(
        child: Observer(
          builder: (_){
            return Row(
              children: [
                Checkbox(value: createStore.hidePhone, onChanged:createStore.setHidePhone, activeColor: Colors.yellow.shade700,),
                Text('ocultar telefone'),
                Checkbox(value: createStore.hideEmail, onChanged: createStore.setHideEmail,activeColor: Colors.yellow.shade700,),
                Text('ocultar e-mail'),
              ],
            );
          },
        ),
      ),
    );
  }
}
