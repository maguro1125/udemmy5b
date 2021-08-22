import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final ValueChanged onSearch;
  final TextEditingController _textEditingController = TextEditingController();

  SearchBar({this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(24.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          onSubmitted: onSearch,//文字の値、処理を返す。呼び出し元のコンストラクタにかえす。
          maxLines: 1,
          controller: _textEditingController,
          decoration: InputDecoration(
              icon: Icon(Icons.search),
              hintText: "検索ワードを入力して下さい",
              border: InputBorder.none),
        ),
      ),
    );
  }
}
