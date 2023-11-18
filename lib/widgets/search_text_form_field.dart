import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../constants/color.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              LineIcons.search,
              color: grey,
            ),
            hintText: "Search a range of groceries",
            hintStyle: TextStyle(
                color: grey, fontWeight: FontWeight.w400, fontSize: 14),
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: grey, width: 1))),
      ),
    );
  }
}
