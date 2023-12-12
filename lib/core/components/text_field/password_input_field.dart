import 'package:flutter/material.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

class PasswordInputField extends StatefulWidget {
  final Function(String) onPasswordChanged;

  const PasswordInputField({Key? key, required this.onPasswordChanged})
      : super(key: key);

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText =
      true; // Şifreyi gizlemek için başlangıçta true olarak ayarla

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 15,
      color: ColorConstants.primaryColor,
      child: TextFormField(
        controller: _passwordController,
        obscureText: _obscureText,
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(color: ColorConstants.inputfieldcolor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              // İkon, şifre görünürlüğü durumuna göre değişir
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey, // İkonun rengi
            ),
            onPressed: () {
              // İkon butonuna basıldığında şifre görünürlüğünü değiştir
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
        onChanged: (value) {
          widget.onPasswordChanged(value); // Callback to the parent widget
        },
        // Burada şifre doğrulaması ekleyebilirsiniz
      ),
    );
  }
}
