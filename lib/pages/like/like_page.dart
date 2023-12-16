import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:ui_project/apps/router/router_name.dart';
import 'package:ui_project/data/data.dart';
import 'package:ui_project/provider/like_provider.dart';

import '../../models/article.dart';

class LikePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> idListLike =
        context.watch<LikeProvider>().listLike; // danh sách id yêu thích

    List<Article> data =
        dataMockup.where((element) => idListLike.contains(element.id)).toList();

    List<Article> dataremove =
        data.where((element) => data.contains(element.id)).toList();

    print("idListLike :${data}");
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<LikeProvider>().deleteAll();
              },
              icon: const Icon(Icons.remove_circle_outline)),
          const SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: data.isNotEmpty
            ? ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                    height:
                        20), // khoảng trống giữa các item (có thể thay thế margin)
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: data.length,
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
                        child: Stack(
                          children: [
                            IconButton(
                                onPressed: () {
                                  context
                                      .read<LikeProvider>()
                                      .deleteItem(dataremove[index].id);
                                },
                                icon: const Icon(Icons.delete)),
                            Container(
                              width: double.infinity,
                              // height: double.infinity,
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                fit: BoxFit.cover,
                                image: data[index].image,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(child: Text("KHÔNG CÓ SẢN PHẨM NÀO CẢ !!!")),
      ),
    );
  }
}
