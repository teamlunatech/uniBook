import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_book/view/home/homePage.dart';

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
      appBar: AppBar(
        title: Text('Flutter Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                labelText: 'Enter text',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String enteredText = _textFieldController.text;
                String currentUserUid =
                    FirebaseAuth.instance.currentUser?.uid ?? '';

                // Check if the report text is not empty before submitting
                if (enteredText.isNotEmpty) {
                  submitReport(currentUserUid, enteredText);
                } else {
                  // Optionally, show an error message or handle the case when the report text is empty
                }
              },
              child: Text('Submit'),
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
        MaterialPageRoute(builder: (context) => HomePage()),
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
