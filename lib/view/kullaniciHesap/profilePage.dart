import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/info/custom_info_container.dart';
import 'package:uni_book/core/components/navbar/navbar.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

                SizedBox(height: MediaQuery.sizeOf(context).height/30),
                CustomInfoContainer(title: "Name", content: "Selen Erdoğan"),
                SizedBox(height: MediaQuery.sizeOf(context).height/30),
                CustomInfoContainer(title: "E-mail", content: "selen@gmail.com"),
                SizedBox(height: MediaQuery.sizeOf(context).height/30),
                CustomInfoContainer(title: "Şifre", content: "*******"),
                SizedBox(height: MediaQuery.sizeOf(context).height/30),
                CustomButton(
                  inputText: 'Çıkış Yap',
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
