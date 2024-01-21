import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/clickable_text.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/text_field/custom_email_field.dart';
import 'package:uni_book/core/components/text_field/password_input_field.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:uni_book/main.dart';
import 'package:uni_book/utilities/show_error_dialog.dart';
import 'package:uni_book/view/authenticate/girisYap/forgotpassword.dart';
import 'package:uni_book/view/authenticate/kayitOl/VerifyPage.dart';
import 'package:uni_book/view/authenticate/kayitOl/kayit_ol_ekrani.dart';
import 'package:uni_book/view/home/homePage.dart';
import 'package:uni_book/view/welcomepage/welcome_page.dart';

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

  Future<void> checkUserStatus(String uid, BuildContext context) async {
    try {
      final DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('Users').doc(uid).get();

      if (!userSnapshot.exists) {
        await FirebaseAuth.instance.signOut();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => WelcomePage()),
          (route) => false,
        );
        showErrorDialog(context, 'Bu hesap banlanmıştır.');
      }
    } catch (e) {
      // Handle any other errors that may occur during the process
      showErrorDialog(context, 'Error checking user status.');
    }
  }

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        await checkUserStatus(user!.uid, context);
        final DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .get();
        int isConfirmed = userSnapshot['isConfirmed'];

        if (isConfirmed != 0) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MainApp()),
            (route) => false,
          );
        } else {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => WelcomePage()),
            (route) => false,
          );
          showErrorDialog(context, 'Kullanıcı henüz doğrulanmadı.');
        }
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DogrulamaMailiSayfasi(), // Pass book data to detail page if needed
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showErrorDialog(context, 'User not found');
      } else if (e.code == 'wrong-password') {
        showErrorDialog(context, 'Wrong credentials');
      } else {
        showErrorDialog(context, 'Error: ${e.code}');
      }
    } catch (e) {
      showErrorDialog(context, e.toString());
    }
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
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => WelcomePage()),
            (route) => false,
          );
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
                    height: MediaQuery.of(context).size.height / 13,
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;
                      await signIn(context, email, password);
                    },
                    borderRadius: 20,
                    boxShadow: BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  ClickableText(
                    text: 'şifreni mi unuttun?',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SifremiUnuttumSayfasi(), // Pass book data to detail page if needed
                        ),
                      );
                    },
                    style: TextStyle(
                      color: ColorConstants.secondaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.5,
                  ),
                  ClickableText(
                    text: 'Yeni üye misin? Kayıt ol.',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              KayitOlEkrani(), // Pass book data to detail page if needed
                        ),
                      );
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
