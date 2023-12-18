
import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uni_book/constants/routes.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';
import 'package:uni_book/utilities/show_error_dialog.dart';

class KimlikKartiYukleme extends StatefulWidget {
  const KimlikKartiYukleme({super.key});

  @override
  State<KimlikKartiYukleme> createState() => _KimlikKartiYuklemeState();
}

class _KimlikKartiYuklemeState extends State<KimlikKartiYukleme> {

  String imageUrl = '';
  ImagePicker imagePicker = ImagePicker();
  XFile? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Öğrenci Kimlik Kartı Yükle",

        titleColor: ColorConstants.secondaryColor,

        backgroundColor: ColorConstants.primaryColor,
        leadingIcon: Icons.arrow_back,
        leadingIconColor: ColorConstants.secondaryColor,
        actionsIconColor: ColorConstants.secondaryColor,
        onActionsIconPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              SizedBox(height: MediaQuery.sizeOf(context).height/20,),
              Image.asset('lib/assets/icons/kimlikkarti.png'),
              SizedBox(height: MediaQuery.sizeOf(context).height/14,),

              SizedBox(
                height: MediaQuery.sizeOf(context).height / 20,
              ),
              Image.asset('lib/assets/icons/kimlikkarti.png'),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 14,
              ),

              CustomButton(
                inputText: 'Galeriyi Aç',
                style: TextStyle(color: ColorConstants.primaryColor),
                backgroundColor: ColorConstants.secondaryColor,

                onPressed: () async {
                  // Pick image
                  file =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                },
                wrapText: true,
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height / 13,

                borderRadius: 20,
                boxShadow: BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),

              CustomButton(
                inputText: 'Kamerayı Aç',
                style: TextStyle(color: ColorConstants.primaryColor),
                backgroundColor: ColorConstants.secondaryColor,

                onPressed: () async {
                  // Pick image
                  file =
                      await imagePicker.pickImage(source: ImageSource.camera);
                },
                wrapText: true,
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height / 13,

                borderRadius: 20,
                boxShadow: BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height / 5.4,
              ),

              CustomButton(
                inputText: 'Tamamla',
                style: TextStyle(color: ColorConstants.primaryColor),
                backgroundColor: ColorConstants.secondaryColor,

                onPressed: () async {
                  if (file == null) return;
                  // File name
                  String fileDateName =
                      DateTime.now().millisecondsSinceEpoch.toString();

                  // Get a reference to storage root
                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference referenceDirImages =
                      referenceRoot.child("Student Cards");

                  // Create a reference for the image to be stored
                  Reference referenceImageToUpload =
                      referenceDirImages.child('$fileDateName.jpg');

                  // Handle Errors
                  try {
                    // Store the file
                    await referenceImageToUpload.putFile(File(file!.path));
                    // Success: get the downlad url
                    imageUrl = await referenceImageToUpload.getDownloadURL();
                  } catch (e) {
                    showErrorDialog(context, e.toString());
                  }
                  Navigator.of(context).pop(imageUrl);
                },
                wrapText: true,
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height / 13,

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
