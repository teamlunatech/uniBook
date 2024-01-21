import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uni_book/classes/Bildirim.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/button/custom_main_button.dart';
import 'package:uni_book/core/components/header_text/custom_header_text.dart';
import 'package:uni_book/core/components/navbar/navbar.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';
import 'package:uni_book/view/kullaniciHesap/selleruserprofilepage.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailPage extends StatelessWidget {
  Bildirim book;

  // Constructor to receive the book variable
  BookDetailPage(this.book);

  @override
  Widget build(BuildContext context) {
    final String bookTitle = book.getBookName();
    final String author = "Oscar Wilde";
    final String category = "Classics";
    final String rating = "4.1/5";
    final String price = book.getprice();
    final String description = book.getUniName();
    final String userUid = book.getUserUid();
    final String imageUrl = book.getImageUrl();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 60,
            ),
            Center(
              child: Image.network(
                imageUrl,
                width: MediaQuery.of(context).size.width * 0.5, // Ekran genişliğinin yarısı kadar genişlik
                height: MediaQuery.of(context).size.height * 0.5, // Ekran yüksekliğinin %20'si kadar yükseklik
              ),
            ),


            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  bookTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Yatay ve dikey iç boşluğu ayarlayın
                decoration: BoxDecoration(
                  color: ColorConstants.primaryColor, // Container rengini ayarlayın
                  borderRadius: BorderRadius.circular(10.0), // Kenar yuvarlatma
                  border: Border.all(
                    color: ColorConstants.secondaryColor, // Kenar rengi
                    width: 2.0, // Kenar kalınlığı
                  ),
                ),
                child: Text(
                  "FİYAT: $price TL",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.secondaryColor, // Yazı rengi
                  ),
                  textAlign: TextAlign.end, // Metni yatayda ortala
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "İLAN AÇIKLAMASI:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      inputText: 'İlana Teklif Ver',
                      style: TextStyle(color: ColorConstants.secondaryColor),
                      backgroundColor: ColorConstants.primaryColor,
                      onPressed: () {
                        launchWhatsApp(userUid);
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
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 500,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      inputText: 'İlan Veren Kullanıcı Profili',
                      style: TextStyle(color: ColorConstants.secondaryColor),
                      backgroundColor: ColorConstants.primaryColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SellerProfilePage(userUid: userUid),
                          ),
                        );
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
                  )
                ],
              ),
            )
          ],
        ),
      ),

    );
  }

  Future<void> launchWhatsApp(String userUid) async {
    final userDoc =
        await FirebaseFirestore.instance.collection('Users').doc(userUid).get();

    String phoneNumber = userDoc['phone'];

    //String message = 'Hello';

    final Uri whatsApp = Uri.parse('https://wa.me/$phoneNumber');

    if (!await launchUrl(whatsApp)) {
      throw Exception('Could not launch $whatsApp');
    }
  }
}
