import 'package:flutter/material.dart';
import 'package:found_and_lost_app/models/user/user_manager.dart';
import 'package:found_and_lost_app/screens/login_screen.dart';
import 'package:found_and_lost_app/store_controllers/category_store.dart';
import 'package:found_and_lost_app/widgets/class_builder.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(CategoryStore());
  GetIt.instance.registerSingleton<UserManager>(UserManager());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                  color: Colors.yellow,
                  elevation: 0,
                  centerTitle: true,
                  iconTheme: IconThemeData(color: Colors.white))),
        home: LoginScreen(),
      ),
    );
  }
}

