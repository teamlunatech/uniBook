import 'package:flutter/material.dart';
import 'package:uni_book/core/init/constants/color_constants.dart';

class MySearchBar extends StatefulWidget {
  @override
  _MySearchBarState createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Ara...',
<<<<<<< HEAD
          prefixIcon: Icon(Icons.search, color: Colors.black),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear, color: Colors.black),
=======
          prefixIcon: Icon(Icons.search, color: ColorConstants.secondaryColor),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear, color: ColorConstants.secondaryColor),
>>>>>>> a-branch
            onPressed: () {
              _searchController.clear();
            },
          ),
          border: OutlineInputBorder(
            borderRadius:
<<<<<<< HEAD
            BorderRadius.circular(10.0), // Sınırları yuvarlatmak için
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.grey),
          ),

          fillColor: ColorConstants.inputfieldcolor,
          filled: true,
        ),
        style: TextStyle(color: Colors.black),
=======
            BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: ColorConstants.secondaryColor),
          ),
          fillColor: ColorConstants.primaryColor,
          filled: true,
        ),
        style: TextStyle(color: ColorConstants.inputfieldcolor),
>>>>>>> a-branch
        onChanged: (text) {
          print('Arama: $text');
        },
      ),
    );
  }
}
