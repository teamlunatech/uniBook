import 'package:flutter/material.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_main_button.dart';

import 'package:uni_book/core/components/header_text/custom_header_text.dart';

import 'package:uni_book/core/components/navbar/navbar.dart';
import 'package:uni_book/core/components/searchBar.dart';
import 'package:uni_book/core/components/slider/slider.dart';
import '../../core/init/constants/color_constants.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 25,),
              SearchBar(),
              CustomHeaderText(text: "İyi Okumalar"),


              ImageSlider(
                images: [
                  AssetImage('lib/assets/icons/slider.png'),
                  AssetImage('lib/assets/icons/slider.png'),
                  AssetImage('lib/assets/icons/slider.png'),
                ],
              ),
              SizedBox(height: 15,),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // İki sütunlu yapı
                    crossAxisSpacing: 10, // Yatay aralık
                    mainAxisSpacing: 10, // Dikey aralık
                    childAspectRatio: 2 / 2, // Her öğenin boyut oranı
                  ),
                  itemCount: 10, // Toplam 10 öğe
                  itemBuilder: (context, index) {
                    return CustomMainButton(
                      backgroundColor: ColorConstants.secondaryColor,
                      borderRadius: 10,
                      imagePath: "lib/assets/icons/kitapresmi.png",
                      text1: "Kitap Adı $index",
                      text2: "Kitap $index",
                      text3: "Kitap $index",
                      icon: Icons.favorite_border,
                    );
                  },
                ),
              ),
            ],
          ),

    )
    ),
      bottomNavigationBar: CustomBottomNavigationBar(onTabSelected: (int ) {  },),
    );
  }
}



class CustomTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double textSize = MediaQuery.of(context).size.width * 0.06; // Text boyutu

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "İyi Okumalar!",
          style: TextStyle(
            fontFamily: 'PoppinsExtraBoldItalic',
            fontSize: textSize,
            fontWeight: FontWeight.w700,
            color: ColorConstants.secondaryColor
          ),
        ),
      ),
    );
  }
}


class MyGridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold ekleyerek ana yapımızı oluşturuyoruz.
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // İki sütunlu yapı
          crossAxisSpacing: 10, // Yatay aralık
          mainAxisSpacing: 10, // Dikey aralık
          childAspectRatio: 3 / 2, // Her öğenin boyut oranı
        ),
        itemCount: 10, // Toplam 10 öğe
        itemBuilder: (context, index) {
          // CustomMainButton widget'ınız burada kullanılıyor.
          return CustomMainButton(
            backgroundColor: ColorConstants.secondaryColor,
            borderRadius: 10,
            imagePath: "lib/assets/icons/kitapresmi.png",
            text1: "Kitap Adı $index",
            text2: "Kitap $index",
            text3: "Kitap $index",
            icon: Icons.add_box_outlined,
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(onTabSelected: (int ) {  },),
    );
  }
}
