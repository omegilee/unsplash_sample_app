import '../entity/search.dart';
import 'client.dart';

class SearchClient {
  static Future<SearchResponse?> getPhotos(
      {int page = 1, String query = ""}) async {
    final response = await get(path: "/search/photos", query: {
      "page": page.toString(),
      "query": query,
      "client_id": Config.getAccessToken()
    });
    try {
      return SearchResponse.fromJson(response!);
      // ignore: empty_catches
    } catch (e) {}
    return null;
  }
}
