import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_book/classes/Bildirim.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_main_button.dart';
import 'package:uni_book/core/components/header_text/custom_header_text.dart';
import 'package:uni_book/core/components/navbar/navbar.dart';
import 'package:uni_book/functions/real_time_get_data.dart';

import '../../core/init/constants/color_constants.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Bildirim> favoriteBooks = [];

  @override
  void initState() {
    super.initState();
    loadFavoriteBooks();
  }

  Future<void> loadFavoriteBooks() async {
    List<Bildirim> favorites = await RealTimeData.getFavoriteBooks();
    setState(() {
      favoriteBooks = favorites;
    });
  }

  Future<void> removeFavoriteBook(String bookId) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final User? user = FirebaseAuth.instance.currentUser;
      debugPrint(user?.uid);
      debugPrint(bookId);

      await firestore.collection('Users').doc(user?.uid).update({
        'favorites': FieldValue.arrayRemove([bookId]),
      });
      await loadFavoriteBooks();
    } catch (e) {
      print('Hata: $e');
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
              // Burada istediğiniz arama çubuğunu ekleyebilirsiniz
              CustomHeaderText(text: "Favoriler"),
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
                  itemCount:
                      favoriteBooks.length, // Favori kitap sayısı kadar öğe
                  itemBuilder: (context, index) {
                    Bildirim book = favoriteBooks[index];
                    return CustomMainButton(
                      backgroundColor: ColorConstants.secondaryColor,
                      borderRadius: 10,
                      imagePath: book.imageUrl,
                      text1: book.BookName,
                      text2: "Fiyat: ${book.price}",
                      text3: "Satıcı: ${book.userName}",
                      icon: Icons.favorite_rounded,
                      iconOnPressed: () {
                        removeFavoriteBook(book.BookName);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
