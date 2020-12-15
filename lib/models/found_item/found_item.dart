import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:found_and_lost_app/helpers/strings.dart';
import 'package:found_and_lost_app/models/address.dart';
import 'package:found_and_lost_app/models/category.dart';
import 'package:found_and_lost_app/models/user/user.dart';

enum FoundItemStatus { ACTIVE, DELIVERED, DELETED }

class FoundItem {
  String id;
  List images;
  String title;
  String description;
  Category category;
  Address address;
  String city;
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
    this.city
  });

  FoundItem.fromDocument(DocumentSnapshot doc) {
    id = doc.documentID;
    title = doc['title'] as String;
    city = doc['city'] as String;
    description = doc['description'] as String;
    hideEmail = doc['hide_email'] as bool;
    images =
    List<String>.from(doc.data['images'] as List<dynamic>);
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
