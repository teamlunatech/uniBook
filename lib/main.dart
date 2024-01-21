import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_main_button.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';
import 'package:uni_book/view/authenticate/kayitOl/VerifyPage.dart';

import 'package:uni_book/view/ilanlar/ilan_koyma.dart';
import 'package:uni_book/view/ilanlar/ilan_silme.dart';
import 'package:uni_book/view/ilanlar/ilanlarim.dart';
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uni_book/firebase_options.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';
import 'package:uni_book/view/home/homePage.dart';
import 'package:uni_book/view/ilanlar/ilan_koyma.dart';
import 'package:uni_book/view/ilanlar/ilan_silme.dart';
import 'package:uni_book/view/favorites/favoritesPage.dart';
import 'package:uni_book/view/kullaniciHesap/profilePage.dart';
import 'package:uni_book/view/authenticate/girisYap/giris_yap_ekrani.dart';
import 'package:uni_book/view/authenticate/kayitOl/basarili_kayit_ekrani.dart';
import 'package:uni_book/view/authenticate/kayitOl/kayit_ol_ekrani.dart';
import 'package:uni_book/view/authenticate/kayitOl/VerifyPage.dart';
import 'package:uni_book/view/welcomepage/welcome_page.dart';
import 'package:uni_book/view/kimlik_karti_yukleme/kimlik_bekleniyor.dart';
import 'package:uni_book/view/kimlik_karti_yukleme/kimlik_karti_yukleme.dart';

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
        if (snapshot.connectionState == ConnectionState.done) {
          return checkUserStatus();
        } else {
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
        return const DogrulamaMailiSayfasi(); // Yapılandırmanızı buraya göre ayarlayın
      }
    } else {
      return const WelcomePage();
    }
  }

  Widget checkUserConfirmationStatus() {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          int? isConfirmed = snapshot.data!['isConfirmed'] as int?;
          if (isConfirmed == 0 || isConfirmed == null) {
            return const WelcomePage();
          } else {
            return const MainApp();
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageProvider(),
      child: Consumer<PageProvider>(
        builder: (context, pageProvider, child) {
          return Scaffold(
            body: pageProvider.currentPage,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: pageProvider.selectedIndex,
              onTap: pageProvider.selectPage,
              backgroundColor: ColorConstants.primaryColor, // Arka plan rengi
              selectedItemColor: ColorConstants.secondaryColor, // Seçilen öğe rengi
              unselectedItemColor: Colors.grey, // Seçilmemiş öğe rengi
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
                BottomNavigationBarItem(icon: Icon(Icons.list), label: 'İlanlarım'),
                BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'İlan Koy'),
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoriler'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PageProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  Widget get currentPage {
    switch (_selectedIndex) {
      case 0:
        return const HomePage();
      case 1:
        return MyAdsPage();
      case 2:
        return const IlanKoyma();
      case 3:
        return const FavoritesPage();
      case 4:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }

  int get selectedIndex => _selectedIndex;

  void selectPage(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
