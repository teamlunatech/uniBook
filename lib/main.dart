import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_main_button.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';
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

import 'package:uni_book/constants/routes.dart';

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
      routes: {
        loginRoute: (context) => const GirisYapEkrani(),
        registerRoute: (context) => const KayitOlEkrani(),
        homeRoute: (context) => const HomePage(),
        verifyEmailRoute: (context) =>
            const GirisYapEkrani(), // VerifyEmail ile değiş **********
        welcomeRoute: (context) => const WelcomePage(),
        cardRoute: (context) => const KimlikKartiYukleme()
      },
    );
  }
}

class SimpleBluePage extends StatelessWidget {
  const SimpleBluePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "UNIBOOK",
        titleColor: ColorConstants.secondaryColor,
        backgroundColor: ColorConstants.primaryColor,
        leadingAsset: "lib/assets/icons/app_icon.png",
        actionsIcon: Icons.location_history,
        actionsIconColor: ColorConstants.secondaryColor,
        onActionsIconPressed: () {},
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            CustomButton(
              inputText: 'Giriş Yap',
              style: TextStyle(color: ColorConstants.primaryColor),
              backgroundColor: ColorConstants.secondaryColor,
              onPressed: () {
                print('Butona basıldı!');
              },
              wrapText: true,
              width: 350,
              height: 60,
              borderRadius: 20,
              boxShadow: BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            CustomMainButton(
              backgroundColor: ColorConstants.secondaryColor,
              borderRadius: 8.0,
              imagePath: 'lib/assets/icons/kitapresmi.png',
              text1: 'Kitap Adı',
              text2: 'Kitap Yazarı',
              text3: 'Kitap Fiyatı ',
              onPressed: () {
                print('Custom Button Pressed!');
              },
              icon: Icons.favorite,
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTabSelected: (int) {},
      ),
    );
  }
}

class InitApp extends StatelessWidget {
  const InitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                return const WelcomePage(); // HomePage ile degisecek
              } else {
                //return const VerifyEmailView();
                return const WelcomePage();
              }
            } else {
              return const WelcomePage();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
