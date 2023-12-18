import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_button.dart';

import 'package:uni_book/core/components/text_field/custom_email_field.dart';

import 'package:uni_book/core/components/text_field/name_form_widget.dart';
import 'package:uni_book/core/components/text_field/password_input_field.dart';
import 'package:uni_book/core/components/text_field/phone_input_field.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

import 'package:uni_book/utilities/show_error_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uni_book/constants/routes.dart';
import 'package:uni_book/view/authenticate/kayitOl/basarili_kayit_ekrani.dart';
import 'package:uni_book/view/kimlik_karti_yukleme/kimlik_karti_yukleme.dart';

class KayitOlEkrani extends StatefulWidget {
  const KayitOlEkrani({super.key});

  @override
  State<KayitOlEkrani> createState() => _KayitOlEkraniState();
}

class _KayitOlEkraniState extends State<KayitOlEkrani> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _name;
  String imageUrl = '';

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _name = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _name.dispose();
    super.dispose();
  }

  void handleName(String name) {
    _name.text = name;
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
        title: "Kayıt Ol",
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Text(
                "Kayıt olmak için lütfen bilgilerini gir.",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              NameInputField(
                onNameChanged: handleName,
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
              EmailInputField(
                onEmailChanged: handleEmail,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 14,
              ),
              Text(
                "Senin Gebze Teknik Üniversitesi'nde öğrenci olduğunu doğrulamamız gerek!",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 14,
              ),
              CustomButton(
                inputText: 'Öğrenci Kimlik Kartı Yükle',
                style: TextStyle(color: ColorConstants.primaryColor),
                backgroundColor: ColorConstants.secondaryColor,
                wrapText: true,
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height / 13,
                onPressed: () async {
                  imageUrl = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => KimlikKartiYukleme()));
                },
                borderRadius: 20,
                boxShadow: BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 14,
              ),
              CustomButton(
                inputText: 'Kayıt Ol',
                style: TextStyle(color: ColorConstants.primaryColor),
                backgroundColor: ColorConstants.secondaryColor,
                onPressed: () async {
                  if (imageUrl.isEmpty) {
                    showErrorDialog(context,
                        'Lütfen kayıt olabilmek için öğrenci kimliğinizi yükleyin.');
                    return;
                  }
                  final email = _email.text;
                  final password = _password.text;
                  final name = _name.text;
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    final user = FirebaseAuth.instance.currentUser;
                    await FirebaseFirestore.instance
                        .collection('Users')
                        .doc(user?.uid)
                        .set({
                      'name': name,
                      'email': email,
                      'student card': imageUrl,
                    });
                    await user?.sendEmailVerification();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => BasariliKayitEkrani()),
                      (route) => false,
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      showErrorDialog(context, 'Weak password');
                    } else if (e.code == 'email-already-in-use') {
                      showErrorDialog(context, 'Email already in use');
                    } else if (e.code == 'invalid-email') {
                      showErrorDialog(context, 'Invalid email');
                    } else {
                      showErrorDialog(context, 'Error: ${e.code}');
                    }
                  } catch (e) {
                    showErrorDialog(context, e.toString());
                  }
                },
                wrapText: true,
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height / 13,
                borderRadius: 20,
                boxShadow: BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
