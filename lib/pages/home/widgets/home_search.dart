import 'package:flutter/material.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search key ...",
        enabledBorder: customBorder(), // boder lúc chưa ấn vô
        focusedBorder: customBorder(), //boder lúc bấm vô rồi
        suffixIcon: Icon(
          Icons.search,
          color: Colors.grey.shade500,
        ),
      ),
    );
  }

  OutlineInputBorder customBorder() => OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade500,
        ),
        borderRadius: BorderRadius.circular(10.0),
      );
}
