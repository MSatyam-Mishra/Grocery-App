import 'package:bite_sprint/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../constants/color.dart';
import '../widgets/search_text_form_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: textColorP,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            LineIcons.userCircle,
          ),
        ),
        title: Column(children: [
          Text(
            "Pickup",
            style: textTheme.bodySmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Location 1",
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(Icons.arrow_drop_down_rounded)
            ],
          )
        ]),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Badge(
                  backgroundColor: mainColor,
                  label: Text("2"),
                  isLabelVisible: true,
                  child: Icon(LineIcons.shoppingCart)))
        ],
        bottom: PreferredSize(
          child: SearchTextFormField(),
          preferredSize: Size.fromHeight(55),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        index: 0,
      ),
    );
  }
}
