import 'package:flutter/material.dart';
import 'package:unsplash_sample_app/data/entity/photo_details/photo_details.dart';
import 'package:unsplash_sample_app/presentation/details/photo_details_screen.dart';
import 'package:unsplash_sample_app/presentation/details/photo_gallery_screen.dart';
import 'presentation/search/search_screen.dart';

final routes = Map<String, Widget Function(BuildContext context)>.of({
  "/search": (context) {
    return const SearchScreen();
  },
  "/photo/details": (context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as PhotoDetailsArguments;
    return PhotoDetailsScreen(arguments: arguments);
  },
  "/photo": (context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as PhotoDetails;
    return PhotoGalleryScreen(photoDetails: arguments);
  },
});
