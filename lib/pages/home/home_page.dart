import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_project/pages/home/widgets/home_header.dart';
import 'package:ui_project/pages/home/widgets/home_list_category.dart';
import 'package:ui_project/pages/home/widgets/home_search.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [
              SizedBox(height: 20),
              HomeHeader(),
              SizedBox(height: 10),
              HomeSearch(),
              SizedBox(height: 8),
              Expanded(
                // sd Expanded để chiếm hết vị trí bên dưới
                child: HomeListCategory(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
