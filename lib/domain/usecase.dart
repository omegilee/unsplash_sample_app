import 'dart:developer';

import 'package:unsplash_sample_app/data/client/photo_client.dart';
import 'package:unsplash_sample_app/data/entity/photo_details/photo_details.dart';

import '../data/client/search_client.dart';
import '../data/entity/result.dart';

Future<List<Result>?> getPhotos(int page, String query) {
  return SearchClient.getPhotos(page: page, query: query).then((value) {
    log("response getPhotos >> ${value?.results?.length}");
    return value?.results;
  });
}

Future<PhotoDetails?> getPhotoDetails(String id) {
  return PhotoClient.getPhoto(id);
}
