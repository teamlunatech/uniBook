import 'package:flutter/material.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

class NameInputField extends StatefulWidget {
  final Function(String) onNameChanged;

  const NameInputField({Key? key, required this.onNameChanged})
      : super(key: key);

  @override
  _NameInputFieldState createState() => _NameInputFieldState();
}

class _NameInputFieldState extends State<NameInputField> {
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
            hintText: 'İsim-Soyisim',
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
          onChanged: (value) {
            widget.onNameChanged(value); // Callback to the parent widget
          },
        ),
      ),
    );
  }
}
