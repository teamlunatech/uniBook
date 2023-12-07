import 'package:flutter/material.dart';
import 'package:uni_book/core/components/appbar/appbar.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';


class KimlikBekleniyor extends StatefulWidget {
  const KimlikBekleniyor({super.key});

  @override
  State<KimlikBekleniyor> createState() => _KimlikBekleniyorState();
}

class _KimlikBekleniyorState extends State<KimlikBekleniyor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Kayıt Ol",
        titleColor:  ColorConstants.secondaryColor,
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
              Image.asset('lib/assets/icons/check_box.png'),
              SizedBox(height: MediaQuery.sizeOf(context).height/20,),
              Text("Kimliğiniz Bize Ulaştı!", style: TextStyle(fontSize: 25),),
              SizedBox(height: MediaQuery.sizeOf(context).height/20,),
              Center(child: Text("En kısa sürede size geri dönüş yapacağız!", style: TextStyle(fontSize: 18),)),
            ],
          ),
        ),
      ),

    );
  }
}
