import 'package:flutter/material.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

class AdsInputField extends StatefulWidget {
  final Function(String) onTextChanged;

  const AdsInputField({Key? key, required this.onTextChanged})
      : super(key: key);

  @override
  _AdsInputFieldState createState() => _AdsInputFieldState();
}

class _AdsInputFieldState extends State<AdsInputField> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.primaryColor,
      height: MediaQuery.of(context).size.height / 15,
      child: Form(
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
          onChanged: (value) {
            widget.onTextChanged(value);
          },
        ),
      ),
    );
  }
}

class AdsInputField2 extends StatefulWidget {
  final Function(String) onTextChanged;

  const AdsInputField2({Key? key, required this.onTextChanged})
      : super(key: key);

  @override
  _AdsInputField2State createState() => _AdsInputField2State();
}

class _AdsInputField2State extends State<AdsInputField2> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.primaryColor,
      height: MediaQuery.of(context).size.height / 15,
      child: Form(
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
          onChanged: (value) {
            widget.onTextChanged(value);
          },
        ),
      ),
    );
  }
}

class AdsInputField3 extends StatefulWidget {
  final Function(String) onTextChanged;

  const AdsInputField3({Key? key, required this.onTextChanged})
      : super(key: key);

  @override
  _AdsInputField3State createState() => _AdsInputField3State();
}

class _AdsInputField3State extends State<AdsInputField3> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.primaryColor,
      height: MediaQuery.of(context).size.height / 15,
      child: Form(
        child: TextFormField(
          controller: _nameController,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            hintText: 'İlan Fiyatı',
            hintStyle: TextStyle(color: ColorConstants.inputfieldcolor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          onChanged: (value) {
            widget.onTextChanged(value);
          },
        ),
      ),
    );
  }
}
