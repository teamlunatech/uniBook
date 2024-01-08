import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/button/clickable_text.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';
import 'package:uni_book/view/authenticate/girisYap/giris_yap_ekrani.dart';

class DogrulamaMailiSayfasi extends StatefulWidget {
  const DogrulamaMailiSayfasi({Key? key}) : super(key: key);

  @override
  _DogrulamaMailiSayfasiState createState() => _DogrulamaMailiSayfasiState();
}

class _DogrulamaMailiSayfasiState extends State<DogrulamaMailiSayfasi> {
  bool isButtonEnabled = true;
  String buttonText = 'Doğrulama Mailini Tekrar Gönder';

  Future<void> verifyEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.sendEmailVerification();
      setState(() {
        isButtonEnabled = false;
        buttonText = 'Doğrulama Maili Gönderildi';
      });
    } catch (e) {
      // Handle email verification error
      print("Error sending email verification: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Doğrulama",
        titleColor: ColorConstants.secondaryColor,
        backgroundColor: ColorConstants.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Giriş yapabilmek için hesabınızı doğrulamanız gerekiyor',
                style: TextStyle(
                  color: ColorConstants.secondaryColor,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              CustomButton(
                inputText: buttonText,
                style: TextStyle(color: ColorConstants.primaryColor),
                backgroundColor: ColorConstants.secondaryColor,
                onPressed: isButtonEnabled ? verifyEmail : null,
                wrapText: true,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 13,
                borderRadius: 20,
                boxShadow: BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ),
              SizedBox(height: 20),
              ClickableText(
                text: 'Giriş Sayfasına Dön ',
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => GirisYapEkrani()),
                    (route) => false,
                  );
                },
                style: TextStyle(
                  color: ColorConstants.secondaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
