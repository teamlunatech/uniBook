import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/text_field/custom_email_field.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

import '../../core/init/constants/color_constants.dart';

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
      body: Container(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            children: [
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              Text("Giriş Yapmak İçin Lütfen Bilgilerini Gir.", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w100),),
              SizedBox(height: MediaQuery.of(context).size.height/35,),
              EmailInputField(),

            ],
          ),
        ),
      ),

    );
  }
}
