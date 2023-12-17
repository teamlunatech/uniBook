import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/button/custom_main_button.dart';
import 'package:uni_book/core/components/checkBox/custom_check_box.dart';
import 'package:uni_book/core/components/header_text/custom_header_text.dart';
import 'package:uni_book/core/components/navbar/navbar.dart';
import 'package:uni_book/core/components/text_field/ads_edit_field.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';
import 'package:uni_book/view/home/homePage.dart';
import 'package:uni_book/view/ilanlar/ilan_silme.dart';



class IlanKoyma extends StatefulWidget {
  const IlanKoyma({super.key});

  @override
  State<IlanKoyma> createState() => _IlanKoymaState();
}

class _IlanKoymaState extends State<IlanKoyma> {
  late String _bookName;
  late String _bookContent;

  void setBookName(String bookName) {
    setState(() {
      _bookName = bookName;
    });
  }

  void setBookContent(String bookContent) {
    setState(() {
      _bookContent = bookContent;
    });
  }

  Future<void> _addBookToFirestore() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await FirebaseFirestore.instance.collection('books').add({
          'bookName': _bookName,
          'price': "50",
          'uniName': _bookContent,
          'user_uid': user.uid,
          // Diğer alanlar
        });

        print('Kitap Firestore\'a eklendi.');
        Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      } else {
        print('Kullanıcı bulunamadı.');
      }
    } catch (e) {
      print('Hata: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "İlan Koyma",
        titleColor:  ColorConstants.secondaryColor,
        backgroundColor: ColorConstants.primaryColor,
        leadingIcon: Icons.arrow_back,
        leadingIconColor: ColorConstants.secondaryColor,
        actionsIconColor: ColorConstants.secondaryColor,
        onActionsIconPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CustomHeaderText(text: "Satmak İstediğin Kitabın Bilgilerini Doldur."),
              AdsInputField(onTextChanged: setBookName),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              AdsInputField2(onTextChanged: setBookContent),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              CustomButton(
                inputText: 'Kitabın görselini galeriden yükle',
                style: TextStyle(color: ColorConstants.secondaryColor),
                backgroundColor: ColorConstants.primaryColor,
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
              SizedBox(height: MediaQuery.sizeOf(context).height/50,),
              CustomButton(
                inputText: 'Kitabın görselini fotoğraf çekerek yükle',
                style: TextStyle(color: ColorConstants.secondaryColor),
                backgroundColor: ColorConstants.primaryColor,
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
              SizedBox(height: MediaQuery.sizeOf(context).height/10,),
              CustomCheckbox(isChecked: false), // Varsayılan olarak işaretsiz

              CustomButton(
                inputText: 'Tamamla',
                style: TextStyle(color: ColorConstants.primaryColor),
                backgroundColor: ColorConstants.secondaryColor,
                onPressed: () {
                  print('Butona basıldı!');
                  _addBookToFirestore();
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
      ),


    );
  }
}
