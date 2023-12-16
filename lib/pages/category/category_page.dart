import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:ui_project/apps/router/router_name.dart';
import 'package:ui_project/data/data.dart';

class CategoryPage extends StatelessWidget {
  String? id3, id4;
  CategoryPage({
    super.key,
    this.id3,
    this.id4,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
              height:
                  20), // khoảng trống giữa các item (có thể thay thế margin)
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          itemCount: dataImage.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                // context.go("/homepage/category/product");
                context.goNamed(RouterName.product, pathParameters: {
                  "id1": "anh quân 1",
                  "id2": "anh quân 2",
                });
              },
              child: AspectRatio(
                aspectRatio: 5 / 2,
                child: Container(
                  // margin: const EdgeInsets.only(bottom: 10),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    fit: BoxFit.cover,
                    image: dataImage[index],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
