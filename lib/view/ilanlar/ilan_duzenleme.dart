import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:uni_book/classes/Bildirim.dart';

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
  final Bildirim book;

  IlanDuzenleme({required this.book});

  @override
  State<IlanDuzenleme> createState() => _IlanDuzenlemeState();
}

class _IlanDuzenlemeState extends State<IlanDuzenleme> {
  late String _bookName;
  late String _bookContent;
  late String _price;
  void setBookName(String bookName) {
    setState(() {
      _bookName = bookName;
    });
  }

  void setBookPrice(String bookprice) {
    setState(() {
      _price = bookprice;
    });
  }

  void setBookContent(String bookContent) {
    setState(() {
      _bookContent = bookContent;
    });
  }

  Future<void> kitapduzenle(String bookName) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      User? user = FirebaseAuth.instance.currentUser;

      QuerySnapshot result = await firestore
          .collection('books')
          .where('bookName', isEqualTo: bookName)
          .get();

      // Her bir kaydı sil
      for (QueryDocumentSnapshot document in result.docs) {
        await firestore.collection('books').doc(document.id).update({
          'bookName': _bookName,
          'bookContent': _bookContent,
          'price': _price,
        });
      }
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 100,
              ),
              AdsInputField(onTextChanged: setBookName),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              AdsInputField2(onTextChanged: setBookContent),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              AdsInputField3(onTextChanged: setBookPrice),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              CustomButton(
                inputText: 'İlanı Düzenle',
                style: TextStyle(color: ColorConstants.primaryColor),
                backgroundColor: ColorConstants.secondaryColor,
                onPressed: () {
                  kitapduzenle(widget.book.getBookName());
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
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTabSelected: (int) {},
      ),
    );
  }
}
