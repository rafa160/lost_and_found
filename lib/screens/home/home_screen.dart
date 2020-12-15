import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:found_and_lost_app/models/found_item/found_item.dart';
import 'package:found_and_lost_app/repository/found_item_repository.dart';
import 'package:found_and_lost_app/screens/home/founded_card.dart';
import 'package:found_and_lost_app/service/found_item_service.dart';
import 'package:found_and_lost_app/store_controllers/create_item_store.dart';
import 'package:found_and_lost_app/widgets/backgrounds/background_four.dart';
import 'package:mobx/mobx.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  CreateStore createStore;

  @override
  void initState() {
    createStore = CreateStore(new FoundItemService(new FoundItemRepository()));
    createStore.getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundFour(
          color: Colors.white,
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.1,
                  left: 10,
                  right: 10),
              child: Observer(
                builder: (_) {
                  if (createStore.list?.data == null)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  else if (createStore.list.hasError)
                    return Center(
                      child: Text('Error'),
                    );
                  else if (createStore.list == null)
                    return Container(
                      child: Center(
                        child: Text('nothing here yet'),
                      ),
                    );
                  List<FoundItem> list = createStore.list?.data;
                  return GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: list != null ? list.length : 0,
                      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 1.0),
                      itemBuilder: (_, int index) {
                        var item = list[index];
                        if (createStore == null)
                          return CircularProgressIndicator();
                        else
                          return FoundedCard(
                            image: item.images == null ? Image.asset(
                                'assets/notfound.png') : Image.network(
                                item.images.first),
                            title: item.title == null ? '' : item.title,
                            location: item.city == null ? '' : item.city,
                            hideEmail: item.hideEmail == null ?
                            item.hideEmail = false : item.hideEmail,
                            hidePhone: item.hidePhone == null ?
                            item.hidePhone = false : item.hidePhone,
                          );
                      }
                  );
                },
              ),
            ),
          )
      ),
    );
  }
}
