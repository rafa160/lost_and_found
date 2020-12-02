

import 'package:found_and_lost_app/screens/login_screen.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<LoginScreen>(() => LoginScreen());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }

}