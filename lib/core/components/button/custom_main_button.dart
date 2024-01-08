import 'package:flutter/material.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

class CustomMainButton extends StatelessWidget {
  final Color backgroundColor;
  final double borderRadius;
  final String imagePath;
  final String text1;
  final String text2;
  final String text3;
  final IconData? icon;
  final VoidCallback? onPressed;

  CustomMainButton({
    required this.backgroundColor,
    required this.borderRadius,
    required this.imagePath,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: screenWidth / 2,
        height: screenHeight / 2.8,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Stack(
          // Stack widget'ını kullanarak ikonu üstüne yerleştir
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.white,
                    width: screenWidth / 2,
                    child: Image.network(
                      imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Bu satır değiştirildi
                    children: [
                      Text(
                        text1,
                        style: TextStyle(
                            color: ColorConstants.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Text(
                        text2,
                        style: TextStyle(color: ColorConstants.primaryColor),
                      ),
                      SizedBox(height: 10),
                      Text(
                        text3,
                        style: TextStyle(color: ColorConstants.primaryColor),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
            if (icon != null) // İkon varsa, sağ üst köşeye yerleştir
              Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  icon,
                  color: ColorConstants.secondaryColor, // İkon rengi
                ),
              ),
          ],
        ),
      ),
    );
  }
}
