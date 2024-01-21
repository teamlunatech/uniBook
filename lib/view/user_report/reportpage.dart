import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_book/main.dart';
import 'package:uni_book/view/home/homePage.dart';

import '../../core/components/appbar/appbar.dart';
import '../../core/init/constants/color_constants.dart';

class ReportPage extends StatefulWidget {
  final String userUid;

  ReportPage({required this.userUid});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Kullanıcı Rapor Etme",
        titleColor: ColorConstants.secondaryColor,
        backgroundColor: ColorConstants.primaryColor,
        leadingAsset: "lib/assets/icons/app_icon.png",
        actionsIcon: Icons.location_history,
        actionsIconColor: ColorConstants.secondaryColor,
        onActionsIconPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Kullanıcı Hakkında Bizimle Paylaşmak İstediklerinizi Lütfen Buraya Giriniz.",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                labelText: '',
                labelStyle: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                String enteredText = _textFieldController.text;
                String currentUserUid =
                    FirebaseAuth.instance.currentUser?.uid ?? '';

                if (enteredText.isNotEmpty) {
                  submitReport(currentUserUid, enteredText);
                } else {}
              },
              child: Text('Gönder'),
              style: ElevatedButton.styleFrom(
                primary: ColorConstants.secondaryColor,
                minimumSize: Size(190, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void submitReport(String currentUserUid, String reportText) async {
    try {
      // Access the 'Reports' collection in Firestore
      CollectionReference reportsCollection =
          FirebaseFirestore.instance.collection('Reports');

      // Add a new document to the 'Reports' collection
      await reportsCollection.add({
        'reportedUserUid': widget.userUid,
        'reporterUid': currentUserUid,
        'reportText': reportText,
        'timestamp': FieldValue.serverTimestamp(),
      });
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MainApp()),
        (route) => false,
      );
      // Optionally, you can show a success message or navigate to another page
      // after successfully submitting the report.
    } catch (e) {
      print('Error submitting report: $e');
      // Handle errors here
    }
  }
}
