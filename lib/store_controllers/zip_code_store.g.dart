// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zip_code_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ZipCodeStore on _ZipCodeStore, Store {
  Computed<String> _$clearZipCodeComputed;

  @override
  String get clearZipCode =>
      (_$clearZipCodeComputed ??= Computed<String>(() => super.clearZipCode,
              name: '_ZipCodeStore.clearZipCode'))
          .value;

  final _$zipCodeAtom = Atom(name: '_ZipCodeStore.zipCode');

  @override
  String get zipCode {
    _$zipCodeAtom.reportRead();
    return super.zipCode;
  }

  @override
  set zipCode(String value) {
    _$zipCodeAtom.reportWrite(value, super.zipCode, () {
      super.zipCode = value;
    });
  }

  final _$addressAtom = Atom(name: '_ZipCodeStore.address');

  @override
  Address get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(Address value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$errorAtom = Atom(name: '_ZipCodeStore.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ZipCodeStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_searchZipCodeAsyncAction =
      AsyncAction('_ZipCodeStore._searchZipCode');

  @override
  Future<void> _searchZipCode() {
    return _$_searchZipCodeAsyncAction.run(() => super._searchZipCode());
  }

  final _$_ZipCodeStoreActionController =
      ActionController(name: '_ZipCodeStore');

  @override
  void _reset() {
    final _$actionInfo = _$_ZipCodeStoreActionController.startAction(
        name: '_ZipCodeStore._reset');
    try {
      return super._reset();
    } finally {
      _$_ZipCodeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
zipCode: ${zipCode},
address: ${address},
error: ${error},
loading: ${loading},
clearZipCode: ${clearZipCode}
    ''';
  }
}
