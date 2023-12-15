<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
=======
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uni_book/constants/routes.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/firebase_options.dart';
>>>>>>> a-branch

import '../../core/init/constants/color_constants.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
=======
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return _buildUI();
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildUI() {
>>>>>>> a-branch
    return Container(
      color: ColorConstants.primaryColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/icons/app_icon.png'),
<<<<<<< HEAD

=======
>>>>>>> a-branch
            CustomButton(
              inputText: 'Giriş Yap',
              style: TextStyle(color: ColorConstants.primaryColor),
              backgroundColor: ColorConstants.secondaryColor,
              onPressed: () {
                print('Giriş Yap butonuna basıldı!');
<<<<<<< HEAD
              },
              wrapText: true,
              width: MediaQuery.of(context).size.width * 0.85,
              height:  MediaQuery.of(context).size.height/12,
=======
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(loginRoute, (route) => false);
              },
              wrapText: true,
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height / 12,
>>>>>>> a-branch
              borderRadius: 20,
              boxShadow: BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ),
<<<<<<< HEAD

            SizedBox(height: MediaQuery.of(context).size.height/25,),

=======
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
>>>>>>> a-branch
            CustomButton(
              inputText: 'Kayıt Ol',
              style: TextStyle(color: ColorConstants.secondaryColor),
              backgroundColor: ColorConstants.primaryColor,
              onPressed: () {
                print('Kayıt Ol butonuna basıldı!');
<<<<<<< HEAD
              },
              wrapText: true,
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height/12,
=======
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(registerRoute, (route) => false);
              },
              wrapText: true,
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height / 12,
>>>>>>> a-branch
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
<<<<<<< HEAD

=======
>>>>>>> a-branch
  }
}
