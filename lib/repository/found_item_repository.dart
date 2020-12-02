import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:found_and_lost_app/models/found_item/found_item.dart';
import 'package:found_and_lost_app/models/user/user.dart';
import 'package:found_and_lost_app/models/user/user_manager.dart';

class FoundItemRepository {


  final Firestore firestore = Firestore.instance;
  final user = UserManager().loadCurrentUser();
  Future<void> save(FoundItem foundItem) async {
    if (foundItem.reference == null) {
      foundItem.reference = await firestore.collection('founded_item').add({
        'title': foundItem.title,
        'description': foundItem.description,
        'category': foundItem.category.description,
        'hide_phone': foundItem.hidePhone,
        'hide_email': foundItem.hideEmail,
        'images': foundItem.images,
        'created_at': foundItem.createdAt = new DateTime.now(),
        'city': foundItem.address.city.name,
        'user': foundItem.user,
      });
    } else {
      foundItem.reference.updateData({
        'title': foundItem.title,
        'description': foundItem.description,
      });
    }
  }
}