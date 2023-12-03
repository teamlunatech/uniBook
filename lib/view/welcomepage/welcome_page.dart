import 'package:flutter/material.dart';
import 'package:uni_book/core/components/button/custom_button.dart';

import '../../core/init/constants/color_constants.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.primaryColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/icons/app_icon.png'),

            CustomButton(
              inputText: 'Giriş Yap',
              style: TextStyle(color: ColorConstants.primaryColor),
              backgroundColor: ColorConstants.secondaryColor,
              onPressed: () {
                print('Giriş Yap butonuna basıldı!');
              },
              wrapText: true,
              width: MediaQuery.of(context).size.width * 0.85,
              height:  MediaQuery.of(context).size.height/12,
              borderRadius: 20,
              boxShadow: BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height/25,),

            CustomButton(
              inputText: 'Kayıt Ol',
              style: TextStyle(color: ColorConstants.secondaryColor),
              backgroundColor: ColorConstants.primaryColor,
              onPressed: () {
                print('Kayıt Ol butonuna basıldı!');
              },
              wrapText: true,
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height/12,
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
    );

  }
}
