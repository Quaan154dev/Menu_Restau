import 'package:flutter/cupertino.dart';
import 'package:ui_project/models/article.dart';

class LikeProvider extends ChangeNotifier {
  List<int> listLike = [];

  void onLike(int id) {
    // if (listLike.contains(id)) {
    //   listLike.remove(id);
    // } else {
    //   listLike.add(id);
    // }
    listLike.contains(id) ? listLike.remove(id) : listLike.add(id);
    print(listLike);
    notifyListeners();
  }
}
