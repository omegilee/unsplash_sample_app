import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

class Config {
  static String getAccessToken() {
    return "CBRFnkALxQaGvyYVBr8lxqrhCuEppymwCkz9Tvih2_w";
  }

  static const domain = "api.unsplash.com";
}

Future<Map<String, dynamic>?> get(
    {required String path, required Map<String, String> query}) async {
  final client = Client();
  try {
    query["client_id"] = Config.getAccessToken();

    final uri = _creatDefaultUri(path, query: query);
    final header = _createDefaultHeaders();

    log("url : ${uri.toString()}, header : ${header.toString()}");
    final respones = await client.get(uri, headers: header);
    log("response raw : $respones");
    return respones.toJson();
  } catch (e) {
    log("get request error : ${e}");
  } finally {
    client.close();
  }
  return null;
}

Uri _creatDefaultUri(String path,
    {String domain = Config.domain, Map<String, String> query = const {}}) {
  return Uri.https(domain, path, query);
}

Map<String, String> _createDefaultHeaders() {
  return Map.of({"Authorization": Config.getAccessToken()});
}

extension _json on Response {
  Map<String, dynamic?> toJson() {
    var decodeResponse =
        jsonDecode(utf8.decode(bodyBytes)) as Map<String, dynamic?>;
    return decodeResponse;
  }
}
