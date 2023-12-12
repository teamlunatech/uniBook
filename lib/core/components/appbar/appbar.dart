import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? titleColor;
  final Color? backgroundColor;
  final String? leadingAsset;
  final IconData? leadingIcon; // Yeni eklendi
  final Color? leadingIconColor; // Yeni eklendi
  final IconData? actionsIcon;
  final Color? actionsIconColor;
  final Function()? onActionsIconPressed;

  CustomAppBar({
    required this.title,
    this.titleColor,
    this.backgroundColor,
    this.leadingAsset,
    this.leadingIcon, // Yeni eklendi
    this.leadingIconColor, // Yeni eklendi
    this.actionsIcon,
    this.actionsIconColor,
    this.onActionsIconPressed,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize {
    final double appBarHeight = 60.0;
    return Size.fromHeight(appBarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: backgroundColor,
      leading: leadingAsset != null
          ? Image.asset(
        leadingAsset!,
        width: 50,
        height: 100,
      )
          : leadingIcon != null
          ? Icon(
        leadingIcon,
        color: leadingIconColor ?? Colors.black, // Varsayılan renk siyah
      )
          : null,
      actions: actionsIcon != null
          ? [
        IconButton(
          icon: Icon(
            actionsIcon,
            color: actionsIconColor,
          ),
          onPressed: onActionsIconPressed,
        )
      ]
          : null,
      title: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontSize: 22,
        ),
      ),
    );
  }
}
