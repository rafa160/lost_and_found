import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:found_and_lost_app/helpers/strings.dart';
import 'package:found_and_lost_app/store_controllers/create_item_store.dart';
import 'package:found_and_lost_app/widgets/category_screen/category_widget.dart';
import 'package:found_and_lost_app/widgets/text_field_container.dart';

class CategoryField extends StatelessWidget {
  final CreateStore createStore;

  const CategoryField({this.createStore});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return TextFieldContainer(
          child: Column(
            children: [
              ListTile(
                title: createStore.category == null
                    ? Text(
                        Strings.CATEGORY_TEXT,
                        style: TextStyle(
                          color: Colors.black.withAlpha(160),
                        ),
                      )
                    : Text(
                        Strings.CATEGORY_TEXT,
                        style: TextStyle(
                            color: Colors.black.withAlpha(160), fontSize: 12),
                      ),
                trailing: Icon(Icons.keyboard_arrow_down),
                onTap: () async {
                  final category = await showDialog(
                      context: context,
                      builder: (_) => CategoryWidget(
                            showAll: false,
                            selected: createStore.category,
                          ));
                  if (category != null) {
                    createStore.setCategory(category);
                  }
                },
                subtitle: createStore.category == null
                    ? null
                    : Text(
                        '${createStore.category.description}',
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
              ),
              if (createStore.categoryError != null)
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    createStore.categoryError,
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
