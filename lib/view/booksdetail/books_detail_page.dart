import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/button/custom_main_button.dart';
import 'package:uni_book/core/components/header_text/custom_header_text.dart';
import 'package:uni_book/core/components/navbar/navbar.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';


class BookDetailPage extends StatelessWidget {

  final String bookTitle = "The Picture of Dorian Gray";
  final String author = "Oscar Wilde";
  final String category = "Classics";
  final String rating = "4.1/5";
  final String price = "\$25.00";
  final String description =
      "Oscar Wilde's only novel is the dreamlike story of a young man who sells his soul for eternal youth and beauty. In this celebrated work Wilde forged a devastating portrait of the effects of evil and debauchery on a young aesthete in late-19th-century England. Combining elements of the Gothic horror novel and decadent French fiction, the book centers on a striking premise: As Dorian Gray sinks into a life of crime and gross sensuality, his body retains perfect youth and vigor while his recently painted portrait grows day by day into a hideous record of evil, which he must keep hidden from the world. For over a century, this mesmerizing tale of horror and suspense has enjoyed wide popularity. It ranks as one of Wilde's most important creations and among the classic achievements of its kind.";

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.sizeOf(context).height/60,),
            Center(child: Image.asset('lib/assets/icons/kitapresmi.png')),
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Author: $author",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Category: $category",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Rating: $rating",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Pricing: $price",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Description:",
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
                  ),),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height/500,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  inputText: 'İlan Veren Kullanıcı Profili',
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
                  ),),
              )

            ],
          ),
        )

          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(onTabSelected: (int ) {  },),
    );
  }
}
