import 'package:flutter/material.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

class PhoneInputField extends StatefulWidget {
  const PhoneInputField({Key? key}) : super(key: key);

  @override
  _PhoneInputFieldState createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isValidPhoneNumber(String phone) {

    return RegExp(r'^\+?[0-9]{10,15}$').hasMatch(phone);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.primaryColor,
      height: MediaQuery.of(context).size.height / 15,
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: 'Telefon Numarası',
            hintStyle: TextStyle(color: ColorConstants.inputfieldcolor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty || !_isValidPhoneNumber(value)) {
              return 'Lütfen geçerli bir telefon numarası girin';
            }
            return null;
          },
        ),
      ),
    );
  }
}
