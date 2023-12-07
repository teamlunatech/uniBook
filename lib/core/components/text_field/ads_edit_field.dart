import 'package:flutter/material.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

class AdsInputField extends StatefulWidget {
  const AdsInputField({Key? key}) : super(key: key);

  @override
  _AdsInputFieldState createState() => _AdsInputFieldState();
}

class _AdsInputFieldState extends State<AdsInputField> {
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isValidName(String name) {
    return RegExp(r'^[a-zA-ZğüşıöçĞÜŞİÖÇ]+$').hasMatch(name);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.primaryColor,
      height: MediaQuery.of(context).size.height / 15,
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: _nameController,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            hintText: 'İlan İsmi',
            hintStyle: TextStyle(color: ColorConstants.inputfieldcolor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty || !_isValidName(value)) {
              return 'Lütfen geçerli bir isim girin';
            }
            return null;
          },
        ),
      ),
    );
  }
}
class AdsInputField2 extends StatefulWidget {
  const AdsInputField2({Key? key}) : super(key: key);

  @override
  _AdsInputField2State createState() => _AdsInputField2State();
}

class _AdsInputField2State extends State<AdsInputField2> {
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isValidName(String name) {
    return RegExp(r'^[a-zA-ZğüşıöçĞÜŞİÖÇ]+$').hasMatch(name);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.primaryColor,
      height: MediaQuery.of(context).size.height / 15,
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: _nameController,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            hintText: 'İlan Açıklaması',
            hintStyle: TextStyle(color: ColorConstants.inputfieldcolor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty || !_isValidName(value)) {
              return 'Lütfen geçerli bir açıklama girin';
            }
            return null;
          },
        ),
      ),
    );
  }
}
