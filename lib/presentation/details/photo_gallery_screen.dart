import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:unsplash_sample_app/data/entity/photo_details/photo_details.dart';

class PhotoGalleryScreen extends StatelessWidget {

  final PhotoDetails photoDetails;

  const PhotoGalleryScreen({Key? key, required this.photoDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: PhotoView(imageProvider: CachedNetworkImageProvider(photoDetails.urls?.raw ?? ""),
        ),
      ),
    );
  }
}
