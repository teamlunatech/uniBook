import 'package:flutter/material.dart';
import 'package:uni_book/classes/Bildirim.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/clickable_text.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/navbar/navbar.dart';
import 'package:uni_book/core/components/text_field/custom_email_field.dart';
import 'package:uni_book/core/components/text_field/password_input_field.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';
import 'package:uni_book/functions/real_time_get_data.dart';
import 'package:uni_book/view/ilanlar/basarili_ilan_silme.dart';

class IlanSilme extends StatefulWidget {
  final Bildirim book;

  IlanSilme({required this.book});

  @override
  State<IlanSilme> createState() => _IlanSilmeState();
}

class _IlanSilmeState extends State<IlanSilme> {
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('lib/assets/icons/cop.png'),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                    child: Text(
                  "İlanı Silmek İstediğinize Emin Misiniz?",
                  style: TextStyle(fontSize: 25),
                )),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 50,
              ),
              CustomButton(
                inputText: 'İlanı Sil',
                style: TextStyle(color: ColorConstants.primaryColor),
                backgroundColor: ColorConstants.secondaryColor,
                onPressed: () {
                  RealTimeData.deleteBooksByTitle(widget.book.getBookName());
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => BasariliIlanSilme()),
                    (_) => false,
                  );
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
