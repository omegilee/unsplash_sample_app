import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:unsplash_sample_app/data/entity/result.dart';
import 'package:unsplash_sample_app/presentation/details/photo_details_screen.dart';

import 'viewmodel.dart';

class SearchList extends StatefulWidget {
  final SearchViewModel viewModel;
  const SearchList({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  bool _loading = false;

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      final nextPageTrigger = _scrollController.position.maxScrollExtent * 0.8;
      final currentPixels = _scrollController.position.pixels;
      log("onPage >> nextPageTrigger : ${nextPageTrigger}, currentPixels : ${currentPixels}");
      if (_loading == false && currentPixels > nextPageTrigger) {
        _fetchData();
      }
    });
    widget.viewModel.responseLitener = (itemCount) {
      _updateItemCount(itemCount);
    };
    widget.viewModel.onPageLoading = () {
      log("onPage > loading");
      setState(() {
        _loading = true;
      });
    };
    _fetchData();
  }

  @override
  void didUpdateWidget(covariant SearchList oldWidget) {
    super.didUpdateWidget(oldWidget);
    log("##didUpdateWidget###");
    widget.viewModel.copyWith(oldWidget.viewModel);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _updateItemCount(int itemCount) {
    log("_updateItemCount > ${itemCount}");
    setState(() {
      _loading = false;
    });
  }

  void _fetchData() {
    widget.viewModel.requestPage();
  }

  int _getItemCount() {
    return widget.viewModel.getItemCount();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: _getItemCount() <= 0
            ? const Center(child: Text("검색 결과 없다"))
            : _buildItemGridView());
  }

  Widget _buildItemGridView() {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      scrollDirection: Axis.vertical,
      itemCount: _loading ? _getItemCount() + 1 : _getItemCount(),
      controller: _scrollController,
      itemBuilder: (context, index) {
        if (index == _getItemCount()) {
          return const SizedBox(
            height: 100,
            width: double.infinity,
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          final item = widget.viewModel.getItem(index);
          return Container(
            color: Colors.grey[100],
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (item != null) {
                      Navigator.pushNamed(context, "/photo/details",
                          arguments: PhotoDetailsArguments(item));
                    }
                  },
                  child: AspectRatio(
                    aspectRatio: item?.imageRatio() ?? 1,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: item?.urls?.small ?? "",
                      fadeInDuration: const Duration(milliseconds: 300),
                      fadeOutDuration: const Duration(milliseconds: 300),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: CachedNetworkImageProvider(
                                    item?.user?.profileImage?.medium ?? ""))),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: _buildImageTitleAndSub(item, context),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }

  Column _buildImageTitleAndSub(Result? item, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item?.user?.name ?? "",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(
          item?.toSnsName() ?? "",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}
