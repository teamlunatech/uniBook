import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Eğer iOS tarzı ikonlar kullanacaksak
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni_book/classes/Bildirim.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/components/button/clickable_text.dart';
import 'package:uni_book/core/components/button/custom_button.dart';
import 'package:uni_book/core/components/header_text/custom_header_text.dart';
import 'package:uni_book/core/components/navbar/navbar.dart';
import 'package:uni_book/core/components/text_field/custom_email_field.dart';
import 'package:uni_book/core/components/text_field/password_input_field.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';
import 'package:uni_book/functions/real_time_get_data.dart';
import 'package:uni_book/view/ilanlar/basarili_ilan_satma.dart';
import 'package:uni_book/view/ilanlar/ilan_duzenleme.dart';
import 'package:uni_book/view/ilanlar/ilan_silme.dart';

class AdsDetailPage extends StatefulWidget {
  final Bildirim book;

  AdsDetailPage({required this.book});

  @override
  State<AdsDetailPage> createState() => _AdsDetailPageState();
}

class _AdsDetailPageState extends State<AdsDetailPage> {
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 100),
              Center(
                child: Image.network(
                  widget.book.getImageUrl(),
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
              SizedBox(height: 24),
              // Center(
              //   child: Text(
              //     'Oscar Wilde',
              //     style: TextStyle(
              //       fontSize: 25,
              //       fontWeight: FontWeight.w600,
              //     ),
              //   ),
              // ),
              Center(
                child: Text(
                  widget.book.getBookName(),
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
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) =>
                                IlanDuzenleme(book: widget.book)),
                        (_) => false,
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('İlanı Sil'),
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => IlanSilme(book: widget.book)),
                        (_) => false,
                      );
                    },
                  ),
                  ListTile(
                      leading: Icon(Icons.back_hand_sharp),
                      title: Text('İlanı Satıldı'),
                      onTap: () {
                        RealTimeData.deleteBooksByTitle(
                            widget.book.getBookName());
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => BasariliIlanSatma()),
                          (_) => false,
                        );
                      }),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTabSelected: (int) {},
      ),
    );
  }
}
