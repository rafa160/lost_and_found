import 'package:found_and_lost_app/models/category.dart';
import 'package:found_and_lost_app/service/category_service.dart';
import 'package:mobx/mobx.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {

  _CategoryStore() {
    _loadCategories();
  }

  ObservableList<Category> categoryList = ObservableList<Category>();

  @action
  void setCategories(List<Category> categories){
    categoryList.clear();
    categoryList.addAll(categories);
  }

  @observable
  String error;

  @action
  void setError(String value) => error = value;

  Future<void> _loadCategories() async {
    try{
      final categories = await CategoryService().getAllCategories();
      setCategories(categories);
    } catch (e){
      setError(e);
    }

  }

  @computed
  List<Category> get allCategoryList => List.from(categoryList)
      ..insert(0, Category(id: '*', description: 'todas'));

}