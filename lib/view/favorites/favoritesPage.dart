import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_main_button.dart';
import 'package:uni_book/core/components/header_text/custom_header_text.dart';
import 'package:uni_book/core/components/navbar/navbar.dart';

import '../../core/init/constants/color_constants.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
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
              CustomHeaderText(text: "Favoriler"),
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
                      icon: Icons.favorite,
                    );
                  },
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
