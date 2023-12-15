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



          prefixIcon: Icon(Icons.search, color: ColorConstants.secondaryColor),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear, color: ColorConstants.secondaryColor),

            onPressed: () {
              _searchController.clear();
            },
          ),
          border: OutlineInputBorder(
            borderRadius:

            BorderRadius.circular(10.0), // Sınırları yuvarlatmak için
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.grey),
          ),

          fillColor: ColorConstants.inputfieldcolor,
          filled: true,
        ),

        style: TextStyle(color: ColorConstants.inputfieldcolor),
        onChanged: (text) {
          print('Arama: $text');
        },
      ),
    );
  }
}
