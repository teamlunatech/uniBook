import 'package:flutter/material.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uni_book/firebase_options.dart';
import 'package:uni_book/view/authenticate/girisYap/giris_yap_ekrani.dart';
import 'package:uni_book/view/authenticate/kayitOl/kayit_ol_ekrani.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _buildUI(); // Eğer bağlantı tamamlandıysa UI'ı inşa et.
        } else {
          return const Center(
              child:
                  CircularProgressIndicator()); // Aksi takdirde yükleme simgesini göster.
        }
      },
    );
  }

  Widget _buildUI() {
    return Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/icons/app_icon.png'),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            CustomButton(
              inputText: 'Giriş Yap',
              style: TextStyle(color: ColorConstants.primaryColor),
              backgroundColor: ColorConstants.secondaryColor,
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => GirisYapEkrani()),
                  (route) => false,
                );
              },
              wrapText: true,
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height / 12,
              borderRadius: 20,
              boxShadow: BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            CustomButton(
              inputText: 'Kayıt Ol',
              style: TextStyle(color: ColorConstants.secondaryColor),
              backgroundColor: ColorConstants.primaryColor,
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => KayitOlEkrani()),
                  (route) => false,
                );
              },
              wrapText: true,
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height / 12,
              borderRadius: 20,
              boxShadow: BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
