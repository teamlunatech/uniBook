import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Eğer iOS tarzı ikonlar kullanacaksak
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/clickable_text.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/header_text/custom_header_text.dart';
import 'package:uni_book/core/components/navbar/navbar.dart';
import 'package:uni_book/core/components/text_field/custom_email_field.dart';
import 'package:uni_book/core/components/text_field/password_input_field.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';
class AdsDetailPage extends StatefulWidget {
  @override
  State<AdsDetailPage> createState() => _AdsDetailPageState();
}

class _AdsDetailPageState extends State<AdsDetailPage> {
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 100),
              Center(
                child: Image.asset(
                  'lib/assets/icons/kitapresmi.png',
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
              SizedBox(height: 24),
              Center(
                child: Text(
                  'Oscar Wilde',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'The Picture Of Dorian Grey',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Divider(),

              Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('İlan Düzenle'),
                    onTap: () {
                      // İlan Düzenleme işlevi
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('İlanı Sil'),
                    onTap: () {
                      // İlan Silme işlevi
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.back_hand_sharp),
                    title: Text('İlanı Satıldı'),
                    onTap: () {
                      // İlan Silme işlevi
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(onTabSelected: (int ) {  },),
    );
  }
}
