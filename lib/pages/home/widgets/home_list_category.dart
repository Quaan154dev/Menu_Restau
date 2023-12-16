import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:ui_project/apps/router/router_name.dart';
import 'package:ui_project/data/data.dart';
import 'package:ui_project/provider/like_provider.dart';

class HomeListCategory extends StatelessWidget {
  const HomeListCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: dataMockup.length, // có bao nhiều ptử
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // trục phụ có bao nhiều p tử
        mainAxisSpacing: 15, // tách trục phụ
        crossAxisSpacing: 15, // tách trục chính
        childAspectRatio: 1 / 1, // tỉ lệ widget , hight bằng nhau (1 cục)
      ),
      itemBuilder: (BuildContext context, int index) {
        // build ra UI
        return InkWell(
          onTap: () {
            context.goNamed(
              RouterName.product,
              extra:
                  // "id3": "anh quân 3", // b2.tạo dử liệu
                  // "id4": "anh quân 4",
                  dataMockup[index],
            );
          },
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  clipBehavior:
                      Clip.hardEdge, // hiện cái bo tròn do cái viền dưới đề lên
                  width: double.infinity,
                  // alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        // cái bóng khi reload
                        BoxShadow(
                          offset: const Offset(1, 1),
                          color: Colors.grey.shade200,
                          blurRadius: 2,
                          spreadRadius: 2,
                        )
                      ]),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        // full ra
                        child: Hero(
                          tag: 'tag-${dataMockup[index].id}', // mở ra hiệu ứng
                          child: FadeInImage.memoryNetwork(
                            // img từ từ xuất hiện
                            placeholder:
                                kTransparentImage, // img trong suốt ở dưới
                            fit: BoxFit.cover, // full container
                            image: dataMockup[index].image,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: Consumer<LikeProvider>(
                          builder: (context, value, child) => LikeButton(
                            isLiked: value.listLike.contains(
                                dataMockup[index].id), //giá trị ban đầu
                            onTap: (like) {
                              context
                                  .read<LikeProvider>()
                                  .onLike(dataMockup[index].id);
                              return Future.value(!like);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                dataMockup[index].title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
