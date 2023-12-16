import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:ui_project/data/data.dart';
import 'package:ui_project/models/article.dart';
import 'package:ui_project/provider/like_provider.dart';

class ProductPage extends StatelessWidget {
  String? id1, id2, id3, id4;
  Article item;
  ProductPage({
    super.key,
    // this.id1,
    // this.id2,
    this.id3,
    this.id4,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    dataImage.shuffle();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Hero(
                      tag: 'tag-${item.id}', // mở ra hiệu ứng
                      child: FadeInImage.memoryNetwork(
                        width: double.infinity,
                        placeholder: kTransparentImage,
                        fit: BoxFit.cover,
                        image: item.image,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Consumer<LikeProvider>(
                      builder: (context, value, child) => LikeButton(
                        isLiked:
                            value.listLike.contains(item.id), // giá trị ban đầu
                        onTap: (like) {
                          context.read<LikeProvider>().onLike(item.id);
                          print(value);
                          return Future.value(!like);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      item.title.toString(),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      item.description.toString(),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Hic animi nulla. Est quis sit quia facere eos. Deleniti quia voluptatem sequi sapiente recusandae nobis.Natus laboriosam cupiditate possimus repellendus omnis aut eligendi qui. Sequi dolores et corporis. Ut omnis assumenda.Dolores laudantium quia. Quisquam est libero non sed molestiae rerum. Ullam quaerat repellat vero aut. Asperiores distinctio molestiae. Laboriosam perferendis possimus voluptate quo.,Doloremque facere et. Voluptatem molestiae quia sed tosed eum. Molestiae veritatis expedita quia ratione dolorum dolores officii inventore mus voluptate quo.,Doloremque facere et. Voluptatem molestiae quia sed tosed eum.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 18, wordSpacing: 0.2, letterSpacing: 0.5),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
