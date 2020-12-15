import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:found_and_lost_app/helpers/strings.dart';
import 'package:found_and_lost_app/models/found_item/found_item.dart';

import 'package:uuid/uuid.dart';

class FoundItemRepository {
  final Firestore firestore = Firestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  FoundItem foundItem;

  List<dynamic> newImages;

  DocumentReference get firestoreRef => firestore.document('founded_items/' + foundItem.id);

  StorageReference get storageRef => storage.ref().child('founded_items').child(foundItem.id);

  Stream<List<FoundItem>> get() {
    return firestore
        .collection('founded_item')
        .orderBy('created_at')
        .snapshots()
        .map((event) =>
            event.documents.map((e) => FoundItem.fromDocument(e)).toList());
  }



  Future<void> save(FoundItem foundItem) async {
    if (foundItem.reference == null) {
      foundItem.reference = await firestore.collection('founded_item').add({
        'title': foundItem.title,
        'description': foundItem.description,
        'category': foundItem.category.description,
        'hide_phone': foundItem.hidePhone,
        'hide_email': foundItem.hideEmail,
        'created_at': foundItem.createdAt = new DateTime.now(),
        'city': foundItem.address?.city?.name,
        'user': foundItem.user,
      });
    } else {
      foundItem.reference.updateData({
        'title': foundItem.title,
        'description': foundItem.description,
        'category': foundItem.category.description,
        'hide_phone': foundItem.hidePhone,
        'hide_email': foundItem.hideEmail,
        'images': foundItem.images,
        'updated_at': foundItem.createdAt = new DateTime.now(),
        'city': foundItem.address.city.name,
        'user': foundItem.user,
      });
    }
  }
}
