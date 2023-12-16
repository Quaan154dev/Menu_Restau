import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_project/apps/router/router_name.dart';

class Menu_Page extends StatelessWidget {
  const Menu_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              onTap: () {
                context.goNamed(RouterName.home);
              },
              leading: const Icon(CupertinoIcons.home, color: Colors.white),
              title: const Text("Home Screen",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              onTap: () {
                context.goNamed(RouterName.like);
              },
              leading: const Icon(CupertinoIcons.square_favorites,
                  color: Colors.white),
              title: const Text("Favorite Screen",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              onTap: () {
                context.goNamed(RouterName.category);
              },
              leading: const Icon(CupertinoIcons.calendar_today,
                  color: Colors.white),
              title: const Text("Category Screen",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              onTap: () {
                context.goNamed(RouterName.home);
              },
              leading: const Icon(CupertinoIcons.settings, color: Colors.white),
              title: const Text("Setting Screen",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
