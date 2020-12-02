import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:found_and_lost_app/helpers/strings.dart';
import 'package:found_and_lost_app/models/address.dart';
import 'package:found_and_lost_app/models/category.dart';
import 'package:found_and_lost_app/models/user/user.dart';

enum FoundItemStatus { ACTIVE, DELIVERED, DELETED }

class FoundItem {
  String id;
  List<String> images;
  String title;
  String description;
  Category category;
  Address address;
  bool hidePhone;
  bool hideEmail;
  FoundItemStatus status = FoundItemStatus.ACTIVE;
  DateTime createdAt;
  User user;
  int views;

  DocumentReference reference;

  FoundItem({
    this.id,
    this.images,
    this.title,
    this.description,
    this.category,
    this.address,
    this.hidePhone,
    this.hideEmail,
    this.status,
    this.createdAt,
    this.user,
    this.views,
    this.reference,
  });

  FoundItem.fromDocument(DocumentSnapshot doc) {
    id = doc.documentID;
    title = doc['name'] as String;
    description = doc['description'] as String;
    images =
    List<String>.from(doc.data['images'] as List<dynamic>);
  }

  factory FoundItem.fromDoc(DocumentSnapshot doc) {
    return FoundItem(
      title: doc['title'],
      reference: doc.reference,
      description: doc['description'],
    );
  }

  factory FoundItem.fromJson(Map<String, dynamic> json) {
    return FoundItem(
      title: json['title'],
      description: json['description'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {};
}
