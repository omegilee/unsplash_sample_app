import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget {
  final Function(String text) submitted;

  const SearchAppBar({Key? key, required this.submitted}) : super(key: key);

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: double.infinity,
      alignment: Alignment.center,
      child: TextField(
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          fillColor: Colors.transparent,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          hintText: "검색어 입력",
          filled: true,
        ),
        onSubmitted: (value) {
          clearFocus(context);
          widget.submitted(value);
        },
        maxLines: 1,
      ),
    );
  }

  void clearFocus(BuildContext context) {
    final current = FocusScope.of(context);
    current.unfocus();
  }
}
