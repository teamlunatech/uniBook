import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/clickable_text.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/text_field/custom_email_field.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';
import 'package:uni_book/utilities/show_error_dialog.dart';
import 'package:uni_book/view/authenticate/girisYap/giris_yap_ekrani.dart';

class SifremiUnuttumSayfasi extends StatefulWidget {
  const SifremiUnuttumSayfasi({Key? key}) : super(key: key);

  @override
  _SifremiUnuttumSayfasiState createState() => _SifremiUnuttumSayfasiState();
}

class _SifremiUnuttumSayfasiState extends State<SifremiUnuttumSayfasi> {
  bool isButtonEnabled = true;
  String userEmail = '';

  Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: userEmail);
      setState(() {
        isButtonEnabled = false;
      });
    } catch (e) {
      // Handle password reset error (e.g., email not found)
      print("Error sending password reset email: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Şifremi Unuttum",
        titleColor: ColorConstants.secondaryColor,
        backgroundColor: ColorConstants.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            Text(
              "Şifrenizi Yenilemek İçin Mail Adresinizi Giriniz",
              style: TextStyle(
                fontSize: 15,
                color: ColorConstants.secondaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: EmailInputField(
                onEmailChanged: (String email) {
                  setState(() {
                    userEmail = email;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              inputText: 'Yenileme Maili Gönder',
              style: TextStyle(color: ColorConstants.primaryColor),
              backgroundColor: ColorConstants.secondaryColor,
              onPressed: isButtonEnabled
                  ? () {
                      if (userEmail.isEmpty) {
                        showErrorDialog(context, 'Lütfen mail adresi girin.');
                        return;
                      }
                      resetPassword();
                    }
                  : null,
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
    );
  }
}
