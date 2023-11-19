import 'dart:ui';

import 'package:bite_sprint/widgets/bottom_nav_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:models/models.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../constants/color.dart';
import '../widgets/search_text_form_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Row _buildSectionTitle(
      TextTheme textTheme, String title, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        IconButton(
            onPressed: onTap, icon: Icon(Icons.keyboard_arrow_right_rounded))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final categoryList = Category.sampleData;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: textColorP,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(LineIcons.userCircle, color: blackish),
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
              Icon(
                Icons.arrow_drop_down_rounded,
                color: blackish,
              )
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
                  child: Icon(
                    LineIcons.shoppingCart,
                    color: blackish,
                  )))
        ],
        bottom: PreferredSize(
          child: SearchTextFormField(),
          preferredSize: Size.fromHeight(55),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        index: 0,
      ),
      backgroundColor: textColorP,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Column(children: [
          _buildSectionTitle(textTheme, "Popular Categories", () {}),
          Container(
            height: 150,
            // padding: EdgeInsets.only(left: 20),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                //padding: EdgeInsets.only(left: 20),
                itemCount: categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final category = categoryList[index];
                  return InkWell(
                    onTap: () {
                      context.goNamed('category',
                          pathParameters: {'categoryId': category.id});
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: Stack(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage(
                                imageUrl: category.imageUrl!,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Center(
                                    child: Container(
                                        width: 30,
                                        height: 30,
                                        child: JumpingDotsProgressIndicator(
                                          fontSize: 25,
                                        ))),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                                child: Container(
                                  width: 150,
                                  height: 50,
                                  child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 1.0, sigmaY: 1.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.transparent,
                                              Color.fromARGB(64, 158, 158, 158),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                              )),
                          Positioned(
                              bottom: 20,
                              // left: 30,
                              // right: 30,
                              child: Container(
                                  width: 150,
                                  child: Text(
                                    category.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFFAF7F1),
                                      fontSize: 20,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )))
                        ],
                      ),
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
