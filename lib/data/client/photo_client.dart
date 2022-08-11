import 'package:unsplash_sample_app/data/client/client.dart';
import 'package:unsplash_sample_app/data/entity/photo_details/photo_details.dart';

class PhotoClient {
  static Future<PhotoDetails?> getPhoto(String id) async {
    final response = await get(path: "/photos/$id", query: {});
    if (response != null) {
      return PhotoDetails.fromJson(response);
    }
    return null;
  }
}
