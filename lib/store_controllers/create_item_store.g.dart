// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateStore on _CreateStore, Store {
  Computed<bool> _$categoryValidComputed;

  @override
  bool get categoryValid =>
      (_$categoryValidComputed ??= Computed<bool>(() => super.categoryValid,
              name: '_CreateStore.categoryValid'))
          .value;
  Computed<bool> _$imagesValidComputed;

  @override
  bool get imagesValid =>
      (_$imagesValidComputed ??= Computed<bool>(() => super.imagesValid,
              name: '_CreateStore.imagesValid'))
          .value;
  Computed<bool> _$titleValidComputed;

  @override
  bool get titleValid =>
      (_$titleValidComputed ??= Computed<bool>(() => super.titleValid,
              name: '_CreateStore.titleValid'))
          .value;
  Computed<bool> _$descriptionValidComputed;

  @override
  bool get descriptionValid => (_$descriptionValidComputed ??= Computed<bool>(
          () => super.descriptionValid,
          name: '_CreateStore.descriptionValid'))
      .value;
  Computed<dynamic> _$addressComputed;

  @override
  dynamic get address => (_$addressComputed ??=
          Computed<dynamic>(() => super.address, name: '_CreateStore.address'))
      .value;
  Computed<bool> _$formValidComputed;

  @override
  bool get formValid => (_$formValidComputed ??=
          Computed<bool>(() => super.formValid, name: '_CreateStore.formValid'))
      .value;
  Computed<Function> _$sendPressedComputed;

  @override
  Function get sendPressed =>
      (_$sendPressedComputed ??= Computed<Function>(() => super.sendPressed,
              name: '_CreateStore.sendPressed'))
          .value;

  final _$categoryAtom = Atom(name: '_CreateStore.category');

  @override
  Category get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(Category value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$hidePhoneAtom = Atom(name: '_CreateStore.hidePhone');

  @override
  bool get hidePhone {
    _$hidePhoneAtom.reportRead();
    return super.hidePhone;
  }

  @override
  set hidePhone(bool value) {
    _$hidePhoneAtom.reportWrite(value, super.hidePhone, () {
      super.hidePhone = value;
    });
  }

  final _$hideEmailAtom = Atom(name: '_CreateStore.hideEmail');

  @override
  bool get hideEmail {
    _$hideEmailAtom.reportRead();
    return super.hideEmail;
  }

  @override
  set hideEmail(bool value) {
    _$hideEmailAtom.reportWrite(value, super.hideEmail, () {
      super.hideEmail = value;
    });
  }

  final _$titleAtom = Atom(name: '_CreateStore.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_CreateStore.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$showErrosAtom = Atom(name: '_CreateStore.showErros');

  @override
  bool get showErros {
    _$showErrosAtom.reportRead();
    return super.showErros;
  }

  @override
  set showErros(bool value) {
    _$showErrosAtom.reportWrite(value, super.showErros, () {
      super.showErros = value;
    });
  }

  final _$userAtom = Atom(name: '_CreateStore.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$resultsAtom = Atom(name: '_CreateStore.results');

  @override
  ObservableFuture<FoundItem> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(ObservableFuture<FoundItem> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$listAtom = Atom(name: '_CreateStore.list');

  @override
  ObservableStream<List<FoundItem>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableStream<List<FoundItem>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_CreateStoreActionController = ActionController(name: '_CreateStore');

  @override
  void setCategory(Category value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHidePhone(bool value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setHidePhone');
    try {
      return super.setHidePhone(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHideEmail(bool value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setHideEmail');
    try {
      return super.setHideEmail(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void save(FoundItem foundItem) {
    final _$actionInfo =
        _$_CreateStoreActionController.startAction(name: '_CreateStore.save');
    try {
      return super.save(foundItem);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(User value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getList() {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.getList');
    try {
      return super.getList();
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
category: ${category},
hidePhone: ${hidePhone},
hideEmail: ${hideEmail},
title: ${title},
description: ${description},
showErros: ${showErros},
user: ${user},
results: ${results},
list: ${list},
categoryValid: ${categoryValid},
imagesValid: ${imagesValid},
titleValid: ${titleValid},
descriptionValid: ${descriptionValid},
address: ${address},
formValid: ${formValid},
sendPressed: ${sendPressed}
    ''';
  }
}
