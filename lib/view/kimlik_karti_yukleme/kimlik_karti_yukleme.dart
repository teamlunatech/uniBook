import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

class KimlikKartiYukleme extends StatefulWidget {
  const KimlikKartiYukleme({super.key});

  @override
  State<KimlikKartiYukleme> createState() => _KimlikKartiYuklemeState();
}

class _KimlikKartiYuklemeState extends State<KimlikKartiYukleme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Öğrenci Kimlik Kartı Yükle",
        titleColor:  ColorConstants.secondaryColor,
        backgroundColor: ColorConstants.primaryColor,
        leadingIcon: Icons.arrow_back,
        leadingIconColor: ColorConstants.secondaryColor,
        actionsIconColor: ColorConstants.secondaryColor,
        onActionsIconPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height/20,),
              Image.asset('lib/assets/icons/kimlikkarti.png'),
              SizedBox(height: MediaQuery.sizeOf(context).height/14,),
              CustomButton(
                inputText: 'Galeriyi Aç',
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
              SizedBox(height: MediaQuery.of(context).size.height/20,),
              CustomButton(
                inputText: 'Kamerayı Aç',
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
              SizedBox(height: MediaQuery.of(context).size.height/5.4,),
              CustomButton(
                inputText: 'Tamamla',
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
    );
  }
}
