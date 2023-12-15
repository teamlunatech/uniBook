import 'package:flutter/material.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

class PasswordInputField extends StatefulWidget {
<<<<<<< HEAD
  const PasswordInputField({Key? key}) : super(key: key);
=======
  final Function(String) onPasswordChanged;

  const PasswordInputField({Key? key, required this.onPasswordChanged})
      : super(key: key);
>>>>>>> a-branch

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  final TextEditingController _passwordController = TextEditingController();
<<<<<<< HEAD
  bool _obscureText = true; // Şifreyi gizlemek için başlangıçta true olarak ayarla
=======
  bool _obscureText =
      true; // Şifreyi gizlemek için başlangıçta true olarak ayarla
>>>>>>> a-branch

  @override
  Widget build(BuildContext context) {
    return Container(
<<<<<<< HEAD
      height: MediaQuery.sizeOf(context).height/15,
=======
      height: MediaQuery.sizeOf(context).height / 15,
>>>>>>> a-branch
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
<<<<<<< HEAD
=======
        onChanged: (value) {
          widget.onPasswordChanged(value); // Callback to the parent widget
        },
>>>>>>> a-branch
        // Burada şifre doğrulaması ekleyebilirsiniz
      ),
    );
  }
}
