import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:found_and_lost_app/helpers/strings.dart';
import 'package:found_and_lost_app/models/category.dart';
import 'package:found_and_lost_app/models/found_item/found_item.dart';
import 'package:found_and_lost_app/repository/found_item_repository.dart';
import 'package:found_and_lost_app/service/found_item_service.dart';
import 'package:found_and_lost_app/store_controllers/create_item_store.dart';
import 'package:found_and_lost_app/widgets/backgrounds/background_two.dart';
import 'package:found_and_lost_app/widgets/buttons/rounded_button.dart';
import 'package:found_and_lost_app/widgets/category_screen/category_field.dart';
import 'package:found_and_lost_app/widgets/hide_phone_and_email_field.dart';
import 'package:found_and_lost_app/widgets/images_field.dart';
import 'package:found_and_lost_app/widgets/text_field_container.dart';
import 'package:found_and_lost_app/widgets/zip_code_field.dart';

class CreateItem extends StatefulWidget {
  @override
  _CreateItemState createState() => _CreateItemState();
}

class _CreateItemState extends State<CreateItem> {

  final CreateStore createStore = CreateStore(new FoundItemService(new FoundItemRepository()));

  @override
  Widget build(BuildContext context) {
    FoundItem foundItem;
    return Scaffold(
      body: BackgroundTwo(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    title: Text(
                      Strings.ITEM_SCREEN_TITLE,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        ImagesField(createStore),
                        Observer(
                          builder: (_){
                            return TextFieldContainer(
                              child: TextFormField(
                                onChanged: createStore.setTitle,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  errorText: createStore.titleError,
                                  hintText: Strings.MAIN_ITEM_TITLE,
                                  labelStyle: TextStyle(fontWeight: FontWeight.w800),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.fromLTRB(16, 10, 12, 10),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Observer(
                          builder: (_){
                            return TextFieldContainer(
                              child: TextFormField(
                                onChanged: createStore.setDescription,
                                maxLines: null,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  errorText: createStore.descriptionError,
                                  hintText: Strings.SUBTITLE_ITEM,
                                  labelStyle: TextStyle(fontWeight: FontWeight.w800),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.fromLTRB(16, 10, 12, 10),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CategoryField(createStore: createStore),
                        SizedBox(
                          height: 10,
                        ),
                        ZipCodeField(createStore),
                        HideFields(createStore: createStore,),
                        Observer(
                          builder: (_){
                            return Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: GestureDetector(
                                onTap: createStore.invalidSendPressed,
                                child: RoundedButton(
                                  disabledColor: Colors.red,
                                  color: Colors.yellow.withAlpha(200),
                                  child: Text('Criar', style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),),
                                  textColor: Colors.black,
                                  press: createStore.sendPressed
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
