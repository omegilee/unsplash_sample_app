import 'package:flutter/material.dart';
import 'package:unsplash_sample_app/presentation/search/search_appbar.dart';
import 'package:unsplash_sample_app/presentation/search/search_list.dart';
import 'package:unsplash_sample_app/presentation/search/viewmodel.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final viewmodel = SearchViewModel();

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 80,
            elevation: 0,
            flexibleSpace: SearchAppBar(
              submitted: (String text) {
                viewmodel.firstPage(firstPage: true);
                viewmodel.query(text);
                viewmodel.requestPage();
              },
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Expanded(child: SearchList(viewModel: viewmodel))],
          ),
        ),
      ),
    );
  }
}
