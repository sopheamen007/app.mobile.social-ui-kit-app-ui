import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social_ui_kit/pages/chat_page.dart';
import 'package:social_ui_kit/pages/home_page.dart';
import 'package:social_ui_kit/pages/profile_page.dart';
import 'package:social_ui_kit/pages/saved_page.dart';
import 'package:social_ui_kit/theme/colors.dart';
import 'dart:math' as math;

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: getFloatingButton(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        ChatPage(),
        Center(
          child: Text("Upload"),
        ),
        SavedPage(),
        ProfilePage()
      ],
    );
  }

  Widget getFooter() {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(0, 1)),
        ],
        borderRadius: BorderRadius.circular(20),
        color: white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 0;
                    });
                  },
                  child: Icon(
                    Feather.home,
                    size: 25,
                    color: activeTab == 0 ? primary : black,
                  ),
                ),
                SizedBox(
                  width: 55,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 1;
                    });
                  },
                  child: Icon(
                    MaterialIcons.chat_bubble_outline,
                    size: 25,
                    color: activeTab == 1 ? primary : black,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 3;
                    });
                  },
                  child: Icon(
                    Feather.heart,
                    size: 25,
                    color: activeTab == 3 ? primary : black,
                  ),
                ),
                SizedBox(
                  width: 55,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      activeTab = 4;
                    });
                  },
                  child: Icon(
                    MaterialIcons.account_circle,
                    size: 28,
                    color: activeTab == 4 ? primary : black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getFloatingButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          activeTab = 2;
        });
      },
      child: Transform.rotate(
        angle: -math.pi / 4,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 1)),
          ], color: black, borderRadius: BorderRadius.circular(23)),
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Center(
                child: Icon(
              Ionicons.md_add_circle_outline,
              color: white,
              size: 26,
            )),
          ),
        ),
      ),
    );
  }
}
