import 'package:found_and_lost_app/models/found_item/found_item.dart';
import 'package:found_and_lost_app/repository/found_item_repository.dart';

class FoundItemService {

  final FoundItemRepository foundItemRepository;

  FoundItemService(this.foundItemRepository);

  Future save(FoundItem foundItem) {
    return foundItemRepository.save(foundItem);
  }

  Stream<List<FoundItem>> get(){
    return foundItemRepository.get();
  }
}