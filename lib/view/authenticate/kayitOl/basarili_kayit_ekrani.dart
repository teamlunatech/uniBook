import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/clickable_text.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/navbar/navbar.dart';
import 'package:uni_book/core/components/text_field/custom_email_field.dart';
import 'package:uni_book/core/components/text_field/password_input_field.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

class BasariliKayitEkrani extends StatefulWidget {
  const BasariliKayitEkrani({super.key});

  @override
  State<BasariliKayitEkrani> createState() => _BasariliKayitEkraniState();
}

class _BasariliKayitEkraniState extends State<BasariliKayitEkrani> {
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
        child: SingleChildScrollView(
          child: Column(

            children: [
              Image.asset('lib/assets/icons/check_box.png'),
              SizedBox(height: MediaQuery.sizeOf(context).height/20,),
              Text("Başarıyla Kayıt Oldunuz!", style: TextStyle(fontSize: 25),),
              SizedBox(height: MediaQuery.sizeOf(context).height/20,),
              CustomButton(
                inputText: 'Anasayfaya Git',
                style: TextStyle(color: ColorConstants.primaryColor),
                backgroundColor: ColorConstants.secondaryColor,
                onPressed: () {

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
            ],
          ),
        ),
      ),

      bottomNavigationBar: CustomBottomNavigationBar(onTabSelected: (int ) {  },),
    );
  }
}
