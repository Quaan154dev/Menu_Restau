import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:ui_project/apps/router/router.dart';
import 'package:ui_project/pages/category/category_page.dart';
import 'package:ui_project/pages/home/home_page.dart';
import 'package:ui_project/pages/product/product_page.dart';
import 'package:ui_project/provider/like_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LikeProvider(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: RouterCustom.router,
      ),
    );
  }
}
