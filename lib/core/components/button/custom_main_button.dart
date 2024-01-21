import 'package:flutter/material.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

class CustomMainButton extends StatefulWidget {
  final Color backgroundColor;
  final double borderRadius;
  final String imagePath;
  final String text1;
  final String text2;
  final String text3;
  final IconData? icon;
  final VoidCallback? onPressed;
  final VoidCallback? iconOnPressed;

  CustomMainButton({
    required this.backgroundColor,
    required this.borderRadius,
    required this.imagePath,
    required this.text1,
    required this.text2,
    required this.text3,
    this.icon,
    this.onPressed,
    this.iconOnPressed,
  });

  @override
  State<CustomMainButton> createState() => _CustomMainButtonState();
}

class _CustomMainButtonState extends State<CustomMainButton> {
  bool isIconFavorited = false;

  void toggleIconFavorite() {
    setState(() {
      isIconFavorited = !isIconFavorited;
    });
    if (widget.iconOnPressed != null) {
      widget.iconOnPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: screenWidth / 2,
        height: screenHeight / 2.8,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Stack(
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
                      widget.imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.text1,
                        style: TextStyle(
                          color: ColorConstants.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.text2,
                        style: TextStyle(color: ColorConstants.primaryColor),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.text3,
                        style: TextStyle(color: ColorConstants.primaryColor),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
            if (widget.icon != null) // İkon varsa, sağ üst köşeye yerleştir
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(isIconFavorited ? Icons.favorite : Icons.favorite_border),
                  color: ColorConstants.secondaryColor,
                  onPressed: toggleIconFavorite,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
