import 'package:floating_bottom_bar/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/info/custom_info_container.dart';
import 'package:uni_book/core/components/navbar/navbar.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

class ProfileEditPage extends StatelessWidget {
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(

              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('lib/assets/icons/account_circle.png'),
                  backgroundColor: Colors.transparent,
                ),

                SizedBox(height: MediaQuery.sizeOf(context).height/25),
                CustomInfoContainer(title: "Name", content: "Selen Erdoğan"),
                SizedBox(height: MediaQuery.sizeOf(context).height/20),
                CustomInfoContainer(title: "E-mail", content: "selen@gmail.com"),
                SizedBox(height: MediaQuery.sizeOf(context).height/10),

            CustomButton(
              inputText: 'Kullanıcıyı Şikayet Et',
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
                color: ColorConstants.secondaryColor,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(onTabSelected: (int ) {  },),
    );
  }



}



