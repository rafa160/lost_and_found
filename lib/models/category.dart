import 'package:cloud_firestore/cloud_firestore.dart';

class Category {

  String id;
  String description;

  Category({this.id, this.description});

  Category.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    description = snapshot.data['description'] as String;
  }

  @override
  String toString() {
    return 'Category{description: $description}';
  }
}