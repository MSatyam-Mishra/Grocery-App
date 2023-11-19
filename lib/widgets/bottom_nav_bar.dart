import 'package:bite_sprint/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
            backgroundColor: bottomNavBG,
            labelTextStyle: MaterialStatePropertyAll(Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: blackish))),
        child: NavigationBar(
          elevation: 20,
          indicatorColor: Colors.transparent,
          selectedIndex: index,
          destinations: [
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: NavigationDestination(
                icon: SvgPicture.asset("assets/bottom_icons/home-2-linear.svg"),
                selectedIcon: SvgPicture.asset(
                    "assets/bottom_icons/home-smile-linea.svg"),
                label: "Home",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: NavigationDestination(
                icon: SvgPicture.asset("assets/bottom_icons/cart-linear.svg"),
                selectedIcon:
                    SvgPicture.asset("assets/bottom_icons/cart-bold.svg"),
                label: "Browse",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: NavigationDestination(
                icon: SvgPicture.asset("assets/bottom_icons/scan.svg"),
                selectedIcon: SvgPicture.asset("assets/bottom_icons/scan.svg"),
                label: "Scan",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: NavigationDestination(
                icon: SvgPicture.asset("assets/bottom_icons/history-linea.svg"),
                selectedIcon:
                    SvgPicture.asset("assets/bottom_icons/history-linear.svg"),
                label: "Order",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: NavigationDestination(
                icon: SvgPicture.asset("assets/bottom_icons/heart-outline.svg"),
                selectedIcon:
                    SvgPicture.asset("assets/bottom_icons/heart-bold.svg"),
                label: "Favourite",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
