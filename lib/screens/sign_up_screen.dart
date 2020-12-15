import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:found_and_lost_app/helpers/strings.dart';
import 'package:found_and_lost_app/helpers/validators.dart';
import 'package:found_and_lost_app/models/user/user.dart';
import 'package:found_and_lost_app/models/user/user_manager.dart';
import 'package:found_and_lost_app/screens/home/home_screen.dart';
import 'package:found_and_lost_app/screens/root/root_screen.dart';
import 'package:found_and_lost_app/widgets/backgrounds/background_two.dart';
import 'package:found_and_lost_app/widgets/buttons/rounded_button.dart';
import 'package:found_and_lost_app/widgets/text_field_container.dart';
import 'package:provider/provider.dart';
import 'package:brasil_fields/brasil_fields.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final User user = new User();

  final TextEditingController email = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      body: BackgroundTwo(
        child: Form(
          key: _key,
          child: Consumer<UserManager>(
            builder: (_, userManager, __) {
              return Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    title: Text(
                      Strings.TITLE,
                      style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      enabled: !userManager.loading,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.yellow,
                      validator: (email) {
                        if (email.isEmpty)
                          return Strings.VALIDATOR_STRING;
                        else if (!emailValid(email)) return Strings.EMAIL_ERROR;
                        return null;
                      },
                      onSaved: (email) => user.email = email,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.black.withAlpha(100),
                          ),
                          // errorText: store.emailError,
                          hintText: Strings.EMAIL_HINT,
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      enabled: !userManager.loading,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter()
                      ],
                      cursorColor: Colors.yellow,
                      onSaved: (phone) => user.phone = phone,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.phone,
                            color: Colors.black.withAlpha(100),
                          ),
                          // errorText: store.emailError,
                          hintText: Strings.PHONE,
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      obscureText: true,
                      enabled: !userManager.loading,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.yellow,
                      maxLength: 6,
                      buildCounter: (BuildContext context,
                              {int currentLength,
                              int maxLength,
                              bool isFocused}) =>
                          null,
                      validator: (senha) {
                        if (senha.isEmpty)
                          return Strings.VALIDATOR_STRING;
                        else if (senha.length < 6) return Strings.ERROR_PASSWORD;
                        return null;
                      },
                      decoration: InputDecoration(
                          // errorText: store.passwordError,
                          counterText: '',
                          icon: Icon(
                            Icons.lock,
                            color: Colors.black.withAlpha(100),
                          ),
                          hintText: Strings.PASSWORD_HINT,
                          border: InputBorder.none),
                      onSaved: (senha) => user.password = senha,
                    ),
                  ),
                  SizedBox(
                    height: size.height / 30,
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      cursorColor: Colors.yellow,
                      maxLength: 6,
                      buildCounter: (BuildContext context,
                              {int currentLength,
                              int maxLength,
                              bool isFocused}) =>
                          null,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Colors.black.withAlpha(100),
                          ),
                          counterText: '',
                          hintText: Strings.CONFIRM_PASSWORD,
                          border: InputBorder.none),
                      validator: (senha) {
                        if (senha.isEmpty)
                          return Strings.VALIDATOR_STRING;
                        else if (senha.length < 6) return Strings.ERROR_PASSWORD;
                        return null;
                      },
                      onSaved: (confirmPass) =>
                          user.confirmPassword = confirmPass,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  RoundedButton(
                    color: Colors.yellow.withAlpha(200),
                    textColor: Colors.black,
                    child: userManager.loading
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.black),
                            strokeWidth: 5,
                          )
                        : Text(
                            Strings.SIGN_UP_TEXT,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                    press: userManager.loading
                        ? null
                        : () {
                      if (_key.currentState.validate()) {
                        _key.currentState.save();
                        if (user.password != user.confirmPassword) {
                          scaffoldKey.currentState
                              .showSnackBar(SnackBar(
                            content: Row(
                              children: [
                                Icon(Icons.error),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(Strings.DIFERENT_PASSWORD)
                              ],
                            ),
                            backgroundColor: Colors.red,
                          ));
                          return;
                        }
                        Provider.of<UserManager>(context, listen: false).signUp(
                            user: user,
                            onSuccess: () {
                              debugPrint('sucesso');
                              if(user.finishedTour != false)
                              Navigator.pushReplacement(context,MaterialPageRoute(builder: (_) => RootScreen()));
                              else
                                Navigator.pushReplacement(context,MaterialPageRoute(builder: (_) => RootScreen()));
                            },
                            onFail: (e) {
                              scaffoldKey.currentState
                                  .showSnackBar(SnackBar(
                                content: Row(
                                  children: [
                                    Icon(Icons.error),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('$e')
                                  ],
                                ),
                                backgroundColor: Colors.red,
                              ));
                            });
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
