import 'package:found_and_lost_app/models/address.dart';
import 'package:found_and_lost_app/service/zip_code_service.dart';
import 'package:mobx/mobx.dart';

part 'zip_code_store.g.dart';

class ZipCodeStore = _ZipCodeStore with _$ZipCodeStore;

abstract class _ZipCodeStore with Store{

  _ZipCodeStore() {
    autorun((_){
      if(clearZipCode.length != 8) {
        _reset();
      } else {
        _searchZipCode();
      }
    });
  }

  @observable
  String zipCode = '';

  void setZipCode(String value) => zipCode = value;

  @computed
  String get clearZipCode => zipCode.replaceAll(RegExp('[^0-9]'), '');

  @observable
  Address address;

  @observable
  String error;

  @observable
  bool loading = false;

  @action
  Future<void> _searchZipCode() async {
    loading = true;
    try {
      address = await ZipCodeService().getAddressFromApi(clearZipCode);
      error = null;
    } catch (e){
      error = e;
      address = null;
    }
    loading = false;
  }

  @action
  void _reset() {
    address = null;
    error = null;
  }

}