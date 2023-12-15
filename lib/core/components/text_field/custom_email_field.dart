import 'package:flutter/material.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

class EmailInputField extends StatefulWidget {
<<<<<<< HEAD
  const EmailInputField({Key? key}) : super(key: key);
=======
  final Function(String) onEmailChanged;

  const EmailInputField({Key? key, required this.onEmailChanged})
      : super(key: key);
>>>>>>> a-branch

  @override
  _EmailInputFieldState createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isValidEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.primaryColor,
<<<<<<< HEAD
      height: MediaQuery.sizeOf(context).height/15,
=======
      height: MediaQuery.sizeOf(context).height / 15,
>>>>>>> a-branch
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: TextStyle(color: ColorConstants.inputfieldcolor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty || !_isValidEmail(value)) {
              return 'Lütfen geçerli bir e-posta adresi girin';
            }
            return null;
          },
<<<<<<< HEAD
=======
          onChanged: (value) {
            widget.onEmailChanged(value); // Callback to the parent widget
          },
>>>>>>> a-branch
        ),
      ),
    );
  }
}
