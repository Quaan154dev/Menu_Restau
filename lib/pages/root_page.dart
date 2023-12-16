import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ui_project/pages/home/home_page.dart';
import 'package:ui_project/pages/menu/menu_page.dart';

class RootPage extends StatefulWidget {
  Widget child; // để lấy từ màn hình làm màn hình chính
  RootPage({super.key, required this.child});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    final ZoomDrawerController z = ZoomDrawerController();
    return ZoomDrawer(
      controller: z,
      style: DrawerStyle.defaultStyle,
      menuScreen: const Menu_Page(), // màn hình menu bên góc
      mainScreen: widget.child, // màn hình chính hiển thị
      borderRadius: 24.0,
      showShadow: true,
      angle: -12.0,
      drawerShadowsBackgroundColor: Colors.blue,
      // slideWidth: MediaQuery.of(context).size.width * 0.65,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
    );
  }
}
