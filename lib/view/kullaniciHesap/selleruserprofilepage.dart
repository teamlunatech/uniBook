import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/info/custom_info_container.dart';
import 'package:uni_book/core/components/navbar/navbar.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';
import 'package:uni_book/utilities/show_error_dialog.dart';
import 'package:uni_book/view/user_report/reportpage.dart';
import 'package:uni_book/view/welcomepage/welcome_page.dart';

class SellerProfilePage extends StatefulWidget {
  final String userUid;

  const SellerProfilePage({Key? key, required this.userUid}) : super(key: key);

  @override
  State<SellerProfilePage> createState() => _SellerProfilePageState();
}

class _SellerProfilePageState extends State<SellerProfilePage> {
  String name = "";
  String userEmail = "";

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final uid = widget.userUid;
      final userDoc =
          await FirebaseFirestore.instance.collection('Users').doc(uid).get();

      setState(() {
        name = userDoc['name'];
        userEmail = userDoc['email'];
      });
    } catch (e) {
      print('Error: $e');
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('lib/assets/icons/account_circle.png'),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height / 30),
                CustomInfoContainer(title: "Name", content: name),
                SizedBox(height: MediaQuery.sizeOf(context).height / 30),
                CustomInfoContainer(title: "E-mail", content: userEmail),
                SizedBox(height: MediaQuery.sizeOf(context).height / 30),
                CustomButton(
                  inputText: 'Kullanıcıyı Şikayet Et',
                  style: TextStyle(color: ColorConstants.secondaryColor),
                  backgroundColor: ColorConstants.primaryColor,
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ReportPage(userUid: widget.userUid),
                      ),
                    );
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
      bottomNavigationBar: CustomBottomNavigationBar(
        onTabSelected: (int) {},
      ),
    );
  }
}
