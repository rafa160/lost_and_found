import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:found_and_lost_app/helpers/strings.dart';
import 'package:found_and_lost_app/helpers/validators.dart';
import 'package:found_and_lost_app/models/user/user.dart';
import 'package:found_and_lost_app/models/user/user_manager.dart';
import 'package:found_and_lost_app/screens/root/root_screen.dart';
import 'package:found_and_lost_app/screens/sign_up_screen.dart';
import 'package:found_and_lost_app/store_controllers/create_item_store.dart';
import 'package:found_and_lost_app/widgets/backgrounds/background_one.dart';
import 'package:found_and_lost_app/widgets/buttons/rounded_button.dart';

import 'package:found_and_lost_app/widgets/text_field_container.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();

  final User user = new User();

  final CreateStore createStore;

  LoginScreen({this.createStore});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: BackgroundOne(
          color: Colors.white,
          child: Form(
            key: _key,
            child: Observer(
              builder: (_){
                return Consumer<UserManager>(
                  builder: (_,userManager,__){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 10),
                          child: TextFieldContainer(
                            child: TextFormField(
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,
                              validator: (email) {
                                if (!emailValid(email)) return Strings.EMAIL_ERROR;
                                return null;
                              },
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.black.withAlpha(100),
                                  ),
                                  hintText: Strings.EMAIL_HINT,
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        TextFieldContainer(
                          child: TextFormField(
                            controller: password,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            cursorColor: Colors.black,
                            buildCounter: (BuildContext context,
                                {int currentLength,
                                  int maxLength,
                                  bool isFocused}) =>
                            null,
                            maxLength: 6,
                            validator: (senha) {
                              if (senha.isEmpty)
                                return Strings.VALIDATOR_STRING;
                              else if (senha.length < 6) return Strings.ERROR_PASSWORD;
                              return null;
                            },
                            decoration: InputDecoration(
                                counterText: '',
                                icon: Icon(
                                  Icons.lock,
                                  color: Colors.black.withAlpha(100),
                                ),
                                hintText: Strings.PASSWORD_HINT,
                                border: InputBorder.none),
                          ),
                        ),
                        Container(
                          width: size.width * 0.9,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                              child: Text(
                                Strings.REMIND_PASSWORD_TEXT,
                                style: TextStyle(
                                    color: Colors.black.withAlpha(100),
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        RoundedButton(
                          child:  userManager.loading ? CircularProgressIndicator(
                            valueColor:  AlwaysStoppedAnimation(Colors.white),strokeWidth: 5,
                          ) : Text(Strings.LOGIN, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),),
                          color: Colors.yellow.withAlpha(200),
                          textColor: Colors.black,
                          press: () {
                            if (_key.currentState.validate()) {
                              Provider.of<UserManager>(context, listen: false).signIn(
                                  User(email: email.text, password: password.text),
                                  onFail: (e) {
                                    scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                          content: Row(
                                            children: [
                                              Icon(Icons.error),
                                              SizedBox(width: 10,),
                                              Text('$e')
                                            ],
                                          ),
                                          backgroundColor: Colors.red,
                                        )
                                    );
                                  },
                                  onSuccess: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => RootScreen()));
                                  }
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Strings.NEW_USER_TEXT,
                              style: TextStyle(color: Colors.black.withAlpha(100)),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) => SignUpScreen()));
                              },
                              child: Text(
                                Strings.SIGN_UP,
                                style: TextStyle(
                                    color: Colors.black.withAlpha(200),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
