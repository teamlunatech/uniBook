import 'package:flutter/material.dart';
import 'package:uni_book/classes/Bildirim.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_main_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uni_book/core/components/header_text/custom_header_text.dart';

import 'package:uni_book/core/components/navbar/navbar.dart';
import 'package:uni_book/core/components/searchBar.dart';
import 'package:uni_book/core/components/slider/slider.dart';
import 'package:uni_book/functions/real_time_get_data.dart';
import 'package:uni_book/view/booksdetail/books_detail_page.dart';
import '../../core/init/constants/color_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Bildirim> allNots = [];
  List<Bildirim> searchResults = [];
  String selectedUniName = "";

  @override
  void initState() {
    super.initState();
    RealTimeData.realTimeGetData(allNots, (List<Bildirim> bildirimListesi) {
      setState(() {
        allNots = bildirimListesi;
      });
    });
  }

  void onSearch(String text) async {
    if (text.isEmpty) {
      setState(() {
        searchResults = allNots;
      });
    } else {
      await RealTimeData.searchBooks(text).then((results) {
        setState(() {
          searchResults = results;
        });

        // MyGridPage sayfasına geçiş yap
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyGridPage(searchResults: searchResults),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "UNIBOOK",
        titleColor: ColorConstants.secondaryColor,
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
              SizedBox(
                height: 25,
              ),
              MySearchBar(
                onSearch: onSearch,
              ),
              CustomHeaderText(text: "İyi Okumalar"),
              ImageSlider(
                images: [
                  AssetImage('lib/assets/icons/slider.png'),
                  AssetImage('lib/assets/icons/slider.png'),
                  AssetImage('lib/assets/icons/slider.png'),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2 / 2,
                  ),
                  itemCount: allNots.length,
                  itemBuilder: (context, index) {
                    Bildirim book = allNots[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to BookDetailPage when tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetailPage(
                                book), // Pass book data to detail page if needed
                          ),
                        );
                      },
                      child: CustomMainButton(
                        backgroundColor: ColorConstants.secondaryColor,
                        borderRadius: 10,
                        imagePath: "lib/assets/icons/kitapresmi.png",
                        text1: book.BookName,
                        text2: "Fiyat: ${book.price}",
                        text3: "Satıcı: ${book.userName}",
                        icon: Icons.favorite_border,
                        // onPressed: () {
                        //   RealTimeData().addFavoriteBook(book.BookName);
                        // },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(onTabSelected: (int) {}),
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
              color: ColorConstants.secondaryColor),
        ),
      ),
    );
  }
}

class MyGridPage extends StatelessWidget {
  final List<Bildirim> searchResults;

  MyGridPage({required this.searchResults});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Arama Sonuçları",
        titleColor: ColorConstants.secondaryColor,
        backgroundColor: ColorConstants.primaryColor,
        leadingAsset: "lib/assets/icons/app_icon.png",
        actionsIcon: Icons.location_history,
        actionsIconColor: ColorConstants.secondaryColor,
        onActionsIconPressed: () {},
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          Bildirim book = searchResults[index];

          return CustomMainButton(
            backgroundColor: ColorConstants.secondaryColor,
            borderRadius: 10,
            imagePath: "lib/assets/icons/kitapresmi.png",
            text1: book.BookName,
            text2: "Fiyat: ${book.price}",
            text3: "Satıcı: ${book.userName}",
            icon: Icons.favorite_border,
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(onTabSelected: (int) {}),
    );
  }
}
