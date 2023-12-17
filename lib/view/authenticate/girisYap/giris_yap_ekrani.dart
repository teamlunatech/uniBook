import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/clickable_text.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/text_field/custom_email_field.dart';
import 'package:uni_book/core/components/text_field/password_input_field.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:uni_book/utilities/show_error_dialog.dart';
import 'package:uni_book/constants/routes.dart';


class GirisYapEkrani extends StatefulWidget {
  const GirisYapEkrani({super.key});

  @override
  State<GirisYapEkrani> createState() => _GirisYapEkraniState();
}

class _GirisYapEkraniState extends State<GirisYapEkrani> {

  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void handleEmail(String email) {
    _email.text = email;
  }

  void handlePassword(String password) {
    _password.text = password;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Giriş Yap",

        titleColor: ColorConstants.secondaryColor,
        backgroundColor: ColorConstants.primaryColor,
        leadingIcon: Icons.arrow_back,
        leadingIconColor: ColorConstants.secondaryColor,
        actionsIconColor: ColorConstants.secondaryColor,
        onActionsIconPressed: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(welcomeRoute, (route) => false);
        },

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(


            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [





                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  Text(
                    "Giriş yapmak için lütfen bilgilerini gir.",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                  EmailInputField(
                    onEmailChanged: handleEmail,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  PasswordInputField(
                    onPasswordChanged: handlePassword,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),

                  CustomButton(
                    inputText: 'Giriş Yap',
                    style: TextStyle(color: ColorConstants.primaryColor),
                    backgroundColor: ColorConstants.secondaryColor,


                    wrapText: true,
                    width: MediaQuery.of(context).size.width * 0.85,
                    height:  MediaQuery.of(context).size.height/13,

                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;
                      print("$email, $password");
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        final user = FirebaseAuth.instance.currentUser;
                        if (user?.emailVerified ?? false) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              homeRoute, (route) => false);
                        } else {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              verifyEmailRoute, (route) => false);
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          await showErrorDialog(context, 'User not found');
                        } else if (e.code == 'wrong-password') {
                          await showErrorDialog(context, 'Wrong credentials');
                        } else {
                          await showErrorDialog(context, 'Error: ${e.code}');
                        }
                      } catch (e) {
                        await showErrorDialog(context, e.toString());
                      }
                    },


                    borderRadius: 20,
                    boxShadow: BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height/30,),

                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),

                  ClickableText(
                    text: 'şifreni mi unuttun?',
                    onTap: () {
                      print('Metne basıldı!');
                    },

                    style: TextStyle(color: ColorConstants.secondaryColor,decoration: TextDecoration.underline,),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/2.5,),
                  ClickableText(
                    text: 'Yeni üye misin? Kayıt ol.',
                    onTap: () {
                      print('Metne basıldı!');
                    },
                    style: TextStyle(color: ColorConstants.secondaryColor,decoration: TextDecoration.underline,),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.5,
                  ),
                  ClickableText(
                    text: 'Yeni üye misin? Kayıt ol.',
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          registerRoute, (route) => false);
                      print('Metne basıldı!');
                    },
                    style: TextStyle(
                      color: ColorConstants.secondaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
