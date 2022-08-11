// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:unsplash_sample_app/data/entity/photo_details/photo_details.dart';
import 'package:unsplash_sample_app/domain/usecase.dart';
import 'package:unsplash_sample_app/presentation/details/viewmodel.dart';

void main() {
  test("code Text", () async {
    var result = await getPhotoDetails("VWcPlbHglYc");
    print("search client : ${result}");
  });
}
