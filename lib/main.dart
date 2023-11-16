import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';
import 'core/components/button/custom_button.dart';
import 'core/components/navbar/navbar.dart';

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

      home: const SimpleBluePage(),
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

          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(onTabSelected: (int ) {  },),
    );
  }
}
