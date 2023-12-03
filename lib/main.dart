import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_main_button.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';
import 'package:uni_book/view/authenticate/girisYap/giris_yap_ekrani.dart';
import 'package:uni_book/view/welcomepage/welcome_page.dart';
import 'core/components/button/custom_button.dart';
import 'core/components/navbar/navbar.dart';
import 'core/components/text_field/custom_email_field.dart';

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

      home: const GirisYapEkrani(),
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
        titleColor:  ColorConstants.secondaryColor,
        backgroundColor: ColorConstants.primaryColor,
        leadingAsset: "lib/assets/icons/app_icon.png",
        actionsIcon: Icons.location_history,
        actionsIconColor: ColorConstants.secondaryColor,
        onActionsIconPressed: () {},
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
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
            SizedBox(height: 100,),

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
      bottomNavigationBar: CustomBottomNavigationBar(onTabSelected: (int ) {  },),
    );
  }
}
