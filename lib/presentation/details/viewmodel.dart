// ignore_for_file: unused_local_variable

import 'package:unsplash_sample_app/data/entity/photo_details/photo_details.dart';
import 'package:unsplash_sample_app/domain/usecase.dart';
import 'package:unsplash_sample_app/presentation/details/photo_details_screen.dart';

class PhotoDetailsViewmodel {
  final PhotoDetailsArguments arguemtns;

  PhotoDetailsViewmodel(this.arguemtns);

  PhotoDetails? _details;

  PhotoDetails? getDetails(){
    return _details;
  }

  void fetchPhotoDetails(Function() call) async {
    final id = arguemtns.arguments.id ?? "";
    _details = await getPhotoDetails(id);

    call();
  }
}

extension PhotoDetailsExtension on PhotoDetailsViewmodel {
  String imageUrl() => _details?.urls?.regular ?? "";

  double imageRatio() {
    final w = _details?.width;
    final h = _details?.height;
    if (w != null && h != null) {
      return w.toDouble() / h.toDouble();
    }
    return 1.0;
  }

  String profileImage() => _details?.user?.profileImage?.medium ?? "";

  String profileName() => _details?.user?.name ?? "";

  String toSnsName() {
    final items = List<String>.empty(growable: true);

    final instagram = _details?.user?.social?.instagramUsername ?? "";
    final twitter = _details?.user?.social?.twitterUsername ?? "";

    if (instagram.isNotEmpty) {
      items.add(instagram);
    }
    if (twitter.isNotEmpty) {
      items.add(twitter);
    }
    return items.join(",");
  }

  int imageDownloads() => _details?.downloads ?? 0;

  int imageViews() => _details?.views ?? 0;

  String publishingDay() => _details?.createdAt ?? "";

  String cameraInfo() {
    final items = List.empty(growable: true);
    final exif = _details?.exif;
    var make = exif?.make ?? "";
    if (make.isNotEmpty) {
      items.add(make);
    }

    var model = exif?.model ?? "";
    if (model.isNotEmpty) {
      items.add(model);
    }
    return items.join(",");
  }
}
