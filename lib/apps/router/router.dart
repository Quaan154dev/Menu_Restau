import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_project/apps/router/router_name.dart';
import 'package:ui_project/models/article.dart';
import 'package:ui_project/pages/category/category_page.dart';
import 'package:ui_project/pages/home/home_page.dart';
import 'package:ui_project/pages/like/like_page.dart';
import 'package:ui_project/pages/product/product_page.dart';
import 'package:ui_project/pages/root_page.dart';

class RouterCustom {
  static final GoRouter router = GoRouter(
    initialLocation: '/homepage', // màn hình bàn đầu
    routes: <RouteBase>[
      ShellRoute(
        builder: (context, state, child) {
          // cái gì đó trc khi hiển thị ra homepage
          return RootPage(child: child);
        },
        routes: [
          // GoRoute(
          //   path: '/homepage',
          //   name: RouterName.home,
          //   builder: (BuildContext context, GoRouterState state) {
          //     return const HomePage();
          //   },
          //   routes: <RouteBase>[
          //     GoRoute(
          //       path: 'category/:id3/:id4',
          //       name: RouterName.category,
          //       builder: (BuildContext context, GoRouterState state) {
          //         print(state.pathParameters);
          //         Map data = state.pathParameters;
          //         return CategoryPage(
          //           id3: data['id3'],
          //           id4: data['id4'],
          //         );
          //       },
          //       routes: <RouteBase>[
          //         GoRoute(
          //           path: 'product/:id1/:id2', //b1. khai báo đg dẩn
          //           name: RouterName.product,
          //           builder: (BuildContext context, GoRouterState state) {
          //             print(state.pathParameters);
          //             Map data = state.pathParameters;
          //             return ProductPage(
          //               id1: data['id1'], // b3 truyền dử liệu qua sceen
          //               id2: data['id2'],
          //             );
          //           },
          //         )
          //       ],
          //     ),
          //   ],
          // ),
          // GoRoute(
          //   path: '/category',
          //   name: RouterName.category,
          //   builder: (BuildContext context, GoRouterState state) {
          //     return CategoryPage();
          //   },
          //   routes: <RouteBase>[
          //     GoRoute(
          //       path: 'product', //b1. khai báo đg dẩn
          //       name: RouterName.product,
          //       builder: (BuildContext context, GoRouterState state) {
          //         print(state.pathParameters);
          //         Map data = state.pathParameters;
          //         return ProductPage(
          //             // id1: data['id1'], // b3 truyền dử liệu qua sceen
          //             // id2: data['id2'],
          //             );
          //       },
          //     )
          //   ],
          // ),
          GoRoute(
            path: '/homepage',
            name: RouterName.home,
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'product', //b1. khai báo đg dẩn
                name: RouterName.product,
                builder: (BuildContext context, GoRouterState state) {
                  // Map data = state.pathParameters;
                  // Map data =
                  //     state.extra as Map; // extra có thể truyền 1 cái object
                  print(state);
                  Article item = state.extra as Article;
                  return ProductPage(
                    // id3: data['id3'],
                    // id4: data['id4'],
                    // id3: state.uri.queryParameters['id3'],
                    // id4: state.uri.queryParameters['id4'],
                    // id3: data['id3'],
                    // id4: data['id4'],
                    // id3: state.extra.toString(),
                    // id4: state.extra.toString(),
                    item: item,
                  );
                },
              )
            ],
          ),
          GoRoute(
            path: '/like',
            name: RouterName.like,
            builder: (BuildContext context, GoRouterState state) {
              return LikePage();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'product', //b1. khai báo đg dẩn
                name: RouterName.likeProduct,
                builder: (BuildContext context, GoRouterState state) {
                  Article item = state.extra as Article;
                  return ProductPage(
                    item: item,
                  );
                },
              )
            ],
          ),
        ],
      )
    ],
  );
}
