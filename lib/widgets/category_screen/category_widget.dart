import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:found_and_lost_app/helpers/strings.dart';
import 'package:found_and_lost_app/models/category.dart';
import 'package:found_and_lost_app/store_controllers/category_store.dart';
import 'package:found_and_lost_app/widgets/backgrounds/background_three.dart';
import 'package:found_and_lost_app/widgets/error_box.dart';

class CategoryWidget extends StatefulWidget {
  final Category selected;
  final bool showAll;

  CategoryWidget({this.showAll = true, this.selected});

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  CategoryStore categoryStore;

  @override
  void initState() {
    categoryStore = CategoryStore();
    categoryStore.allCategoryList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          title: Text(
            Strings.CATEGORY_WIDGET_TITLE,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BackgroundThree(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Observer(
                builder: (_) {
                  if (categoryStore.error != null) {
                    return ErrorBox(
                      message: categoryStore.error,
                    );
                  } else if (categoryStore.categoryList.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final categories = widget.showAll
                        ? categoryStore.allCategoryList
                        : categoryStore.categoryList;
                    return  SingleChildScrollView(
                      child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          margin: EdgeInsets.fromLTRB(32, 12, 32, 32),
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                final category = categories[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop(category);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height:
                                        50,
                                    color: category.id == widget.selected?.id
                                        ? Colors.yellow.withAlpha(150)
                                        : null,
                                    child: Text(
                                      category.description,
                                      style: TextStyle(
                                          color: Colors.grey[700], fontSize: 16),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (_, __) {
                                return Divider(
                                  height: 3,
                                  color: Colors.black,
                                );
                              },
                              itemCount: categories.length),

                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
