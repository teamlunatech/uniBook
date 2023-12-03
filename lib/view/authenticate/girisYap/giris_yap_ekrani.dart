import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/clickable_text.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/text_field/custom_email_field.dart';
import 'package:uni_book/core/components/text_field/password_input_field.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';


class GirisYapEkrani extends StatefulWidget {
  const GirisYapEkrani({super.key});

  @override
  State<GirisYapEkrani> createState() => _GirisYapEkraniState();
}

class _GirisYapEkraniState extends State<GirisYapEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Giriş Yap",
        titleColor:  ColorConstants.secondaryColor,
        backgroundColor: ColorConstants.primaryColor,
        leadingIcon: Icons.arrow_back,
       leadingIconColor: ColorConstants.secondaryColor,
        actionsIconColor: ColorConstants.secondaryColor,
        onActionsIconPressed: () {},
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
                  SizedBox(height: MediaQuery.of(context).size.height/30,),
                  Text("Giriş yapmak için lütfen bilgilerini gir.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),),
                  SizedBox(height: MediaQuery.of(context).size.height/35,),
                  EmailInputField(),
                  SizedBox(height: MediaQuery.of(context).size.height/40,),
                  PasswordInputField(),
                  SizedBox(height: MediaQuery.of(context).size.height/40,),
                  CustomButton(
                    inputText: 'Giriş Yap',
                    style: TextStyle(color: ColorConstants.primaryColor),
                    backgroundColor: ColorConstants.secondaryColor,
                    onPressed: () {
                      print('Giriş Yap butonuna basıldı!');
                    },
                    wrapText: true,
                    width: MediaQuery.of(context).size.width * 0.85,
                    height:  MediaQuery.of(context).size.height/13,
                    borderRadius: 20,
                    boxShadow: BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/30,),
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
