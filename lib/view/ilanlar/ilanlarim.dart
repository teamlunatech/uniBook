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

class MyAdsPage extends StatelessWidget {
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
      body: Column(
        children: [
          CustomHeaderText(text: "İlanlarım"),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: MediaQuery.sizeOf(context).height/4,),
                Icon(
                  CupertinoIcons.trash,
                  size: 80,
                  color: Colors.grey,
                ),
                SizedBox(height: 16),
                Text(
                  'Henüz verdiğin bir ilan yok!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(onTabSelected: (int ) {  },),
    );
  }
}
