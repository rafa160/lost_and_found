import 'package:found_and_lost_app/models/category.dart';
import 'package:found_and_lost_app/models/found_item/found_item.dart';
import 'package:found_and_lost_app/models/user/user.dart';
import 'package:found_and_lost_app/service/found_item_service.dart';
import 'package:found_and_lost_app/store_controllers/zip_code_store.dart';
import 'package:mobx/mobx.dart';

part 'create_item_store.g.dart';

class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {

  final FoundItemService foundItemService;


  ObservableList images = ObservableList();

  @observable
  Category category;

  _CreateStore(this.foundItemService);

  @action
  void setCategory(Category value) => category = value;

  @computed
  bool get categoryValid => category != null;
  String get categoryError {
    if(!showErros || categoryValid) return null;
    else return 'Campo obrigatório';
  }

  @observable
  bool hidePhone = false;

  @action
  void setHidePhone(bool value) => hidePhone = value;

  @observable
  bool hideEmail = false;

  @action setHideEmail(bool value) => hideEmail = value;


  // creating validators for the item

  @computed
  bool get imagesValid => images.isNotEmpty;
  String get imagesError {
    if(!showErros || imagesValid) return null;
    else return 'Insira imagens';
  }

  @observable
  String title = '';

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get titleValid => title.length >= 6;
  String get titleError {
    if(!showErros || titleValid) return null;
    else if(title.isEmpty) return 'Campo obrigatório';
    else return 'Título muito curto';
  }

  @observable
  String description = '';

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get descriptionValid => description.length >= 10;
  String get descriptionError {
    if(!showErros || descriptionValid) return null;
    else if(description.isEmpty) return 'Campo obrigatório';
    else return 'Descrição muito curta';
  }

  //validete zip code
  ZipCodeStore zipCodeStore = ZipCodeStore();

  @computed get address => zipCodeStore.address;
  bool get addressValid => address != null;
  String get addressError {
    if(!showErros || addressValid) return null;
    else return 'Campo obrigatório';
  }

  @computed
  bool get formValid => imagesValid && titleValid && descriptionValid;

  @computed
  Function get sendPressed => formValid ? _send : null;

  void _send(){
    final item = FoundItem();
    item.title = title;
    item.description = description;
    item.category = category;
    item.hideEmail = hideEmail;
    item.hidePhone = hidePhone;
    item.address = address;
    save(item);
  }

  @observable
  bool showErros = false;

  @action
  void invalidSendPressed() => showErros = true;

  @action
  void save(FoundItem foundItem) {
    foundItemService.save(foundItem);
  }

  @observable
  User user;

  @action
  void setUser(User value) => user = value;

}