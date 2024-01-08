import 'package:flutter/material.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneInputField extends StatefulWidget {
  final Function(String) onPhoneNumberChanged;

  const PhoneInputField({Key? key, required this.onPhoneNumberChanged})
      : super(key: key);

  @override
  _PhoneInputFieldState createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isValidPhoneNumber(String phone) {
    return RegExp(r'^\+?[0-9]{10,15}$').hasMatch(phone);
  }

  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: ColorConstants.primaryColor,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: InternationalPhoneNumberInput(
          keyboardType: TextInputType.number,
          onInputChanged: (PhoneNumber phoneNumber) {},
          countries: const ['TR'],
          maxLength: 13,
          selectorTextStyle: const TextStyle(color: Colors.grey),
          inputDecoration: const InputDecoration(
            hintText: 'Telefon',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 8.0, right: 8.0, top: 15.0, bottom: 15.0),
          ),
        ),
      ),
    );
  }
}

/*
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


class PhoneInputField extends StatelessWidget {
  const PhoneInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: InternationalPhoneNumberInput(
          keyboardType: TextInputType.number,
          onInputChanged: (PhoneNumber phoneNumber) {},
          countries: const ['TR'],
          maxLength: 13,
          selectorTextStyle: const TextStyle(color: Colors.grey),
          inputDecoration: const InputDecoration(
            hintText: 'Telefon',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,

            // Telefon yazısını sola kaydırdık
            contentPadding:
                EdgeInsets.only(left: 8.0, right: 8.0, top: 15.0, bottom: 15.0),
          ),
        ),
      ),
    );
  }
}*/