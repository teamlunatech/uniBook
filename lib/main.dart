import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_main_button.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';
import 'package:uni_book/view/authenticate/kayitOl/VerifyPage.dart';

import 'package:uni_book/view/ilanlar/ilan_koyma.dart';
import 'package:uni_book/view/ilanlar/ilan_silme.dart';
import 'package:uni_book/view/kullaniciHesap/profilePage.dart';
import 'core/components/button/custom_button.dart';
import 'core/components/navbar/navbar.dart';
import 'core/components/text_field/custom_email_field.dart';

import 'package:uni_book/view/authenticate/girisYap/giris_yap_ekrani.dart';
import 'package:uni_book/view/authenticate/kayitOl/basarili_kayit_ekrani.dart';
import 'package:uni_book/view/authenticate/kayitOl/kayit_ol_ekrani.dart';
import 'package:uni_book/view/home/homePage.dart';
import 'package:uni_book/view/kimlik_karti_yukleme/kimlik_bekleniyor.dart';
import 'package:uni_book/view/kimlik_karti_yukleme/kimlik_karti_yukleme.dart';
import 'package:uni_book/view/welcomepage/welcome_page.dart';
import 'core/components/button/custom_button.dart';
import 'core/components/navbar/navbar.dart';

import 'package:uni_book/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const InitApp(),
    );
  }
}

class InitApp extends StatelessWidget {
  const InitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeApp(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return checkUserStatus();
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }

  Future<void> initializeApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Widget checkUserStatus() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      if (user.emailVerified) {
        return checkUserConfirmationStatus();
      } else {
        //return const VerifyEmailView();
        return DogrulamaMailiSayfasi();
      }
    } else {
      return WelcomePage();
    }
  }

  FutureBuilder<DocumentSnapshot> checkUserConfirmationStatus() {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          String isConfirmed = snapshot.data!['isConfirmed'].toString();
          if (isConfirmed == '0' || isConfirmed.isEmpty) {
            return const WelcomePage();
          } else {
            return const HomePage();
          }
        }
      },
    );
  }
}
