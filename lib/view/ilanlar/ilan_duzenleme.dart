import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; 

import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/clickable_text.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/header_text/custom_header_text.dart';
import 'package:uni_book/core/components/navbar/navbar.dart';
import 'package:uni_book/core/components/text_field/ads_edit_field.dart';
import 'package:uni_book/core/components/text_field/custom_email_field.dart';
import 'package:uni_book/core/components/text_field/password_input_field.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

class IlanDuzenleme extends StatefulWidget {
  const IlanDuzenleme({super.key});

  @override
  State<IlanDuzenleme> createState() => _IlanDuzenlemeState();
}

class _IlanDuzenlemeState extends State<IlanDuzenleme> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height/100,),
              AdsInputField(),
              SizedBox(height: MediaQuery.sizeOf(context).height/100,),
              AdsInputField2(),
              SizedBox(height: MediaQuery.sizeOf(context).height/50,),
        CustomButton(
          inputText: 'İlanı Düzenle',
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
          ),)
            ],
          ),
        ),
      ),

      bottomNavigationBar: CustomBottomNavigationBar(onTabSelected: (int ) {  },),
    );
  }
}
