import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:found_and_lost_app/models/category.dart';

class CategoryService {
  final Firestore firestore = Firestore.instance;

  List<Category> allCategoires = [];

  Future<List<Category>> getAllCategories() async {
    final QuerySnapshot snapshot =
        await firestore.collection('categories').getDocuments();

    allCategoires =
        snapshot.documents.map((e) => Category.fromDocument(e)).toList();

    print(allCategoires.toString());
    return allCategoires;
  }
}
