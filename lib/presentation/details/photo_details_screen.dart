import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:unsplash_sample_app/presentation/details/viewmodel.dart';
import 'package:unsplash_sample_app/theme.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

import '../../data/entity/result.dart';

class PhotoDetailsScreen extends StatefulWidget {
  final PhotoDetailsArguments arguments;

  const PhotoDetailsScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  State<PhotoDetailsScreen> createState() {
    // ignore: no_logic_in_create_state
    return _PhotoDetailsScreenState(PhotoDetailsViewmodel(arguments));
  }
}

class _PhotoDetailsScreenState extends State<PhotoDetailsScreen> {
  final PhotoDetailsViewmodel viewmodel;

  _PhotoDetailsScreenState(this.viewmodel);

  @override
  void initState() {
    super.initState();
    viewmodel.fetchPhotoDetails(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                _buildPhotoImage(
                    context: context,
                    ratio: viewmodel.imageRatio(),
                    imageUrl: viewmodel.imageUrl()),
                _buildProfile(
                    context: context,
                    profileUrl: viewmodel.profileImage(),
                    title: viewmodel.profileName(),
                    sub: viewmodel.toSnsName()),
                _buildViewAndDownlaods(
                    context: context,
                    views: viewmodel.imageViews(),
                    downloads: viewmodel.imageDownloads()),
                _buildEtcInfo(
                    context: context,
                    publisingDay: viewmodel.publishingDay(),
                    cameraInfo: viewmodel.cameraInfo(),
                    license: viewmodel.cameraInfo()),
              ]),
            ),
          ),
          _buildImageDownloadsButton()
        ],
      ),
    ));
  }

  Widget _buildPhotoImage(
      {required BuildContext context,
      required ratio,
      required String imageUrl}) {
    return GestureDetector(
      onTapUp: (details) {
        Navigator.pushNamed(context, "/photo", arguments: viewmodel.getDetails() );
      },
      child: AspectRatio(
        aspectRatio: viewmodel.imageRatio(),
        child: viewmodel.imageUrl().isEmpty
            ? Container(
                color: Colors.grey[100],
              )
            : CachedNetworkImage(fit: BoxFit.fill, imageUrl: imageUrl),
      ),
    );
  }

  Widget _buildProfile(
      {required BuildContext context,
      required String profileUrl,
      required String title,
      required String sub}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(children: [
        Container(
          width: 40,
          height: 40,
          decoration: profileUrl.isNotEmpty
              ? BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(profileUrl)))
              : BoxDecoration(shape: BoxShape.circle, color: Colors.grey[100]),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Text(
                sub,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildViewAndDownlaods(
      {required BuildContext context,
      required int views,
      required int downloads}) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  "Views",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 4),
                Text(NumberFormat("###,###").format(views),
                    style: Theme.of(context).textTheme.titleMedium)
              ],
            ),
          ),
          Container(
            width: 1,
            height: 20,
            color: Colors.grey[300],
          ),
          Expanded(
            child: Column(children: [
              Text(
                "Downloads",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 4),
              Text(NumberFormat("###,###").format(views),
                  style: Theme.of(context).textTheme.titleMedium)
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildEtcInfo(
      {required context,
      required String publisingDay,
      required String cameraInfo,
      required String license}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(TextSpan(children: [
            WidgetSpan(
                child: Icon(
                  Icons.date_range_outlined,
                  color: AppTheme.primarySwatch[400],
                ),
                alignment: PlaceholderAlignment.middle),
            TextSpan(
              text: " " + publisingDay,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppTheme.primarySwatch[400]),
            )
          ])),
          const SizedBox(
            height: 4,
          ),
          Text.rich(TextSpan(children: [
            WidgetSpan(
                child: Icon(
                  Icons.camera_alt,
                  color: AppTheme.primarySwatch[400],
                ),
                alignment: PlaceholderAlignment.middle),
            TextSpan(
              text: " " + cameraInfo,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppTheme.primarySwatch[400]),
            )
          ])),
          const SizedBox(
            height: 4,
          ),
          Text.rich(TextSpan(children: [
            WidgetSpan(
              child: Icon(
                Icons.info,
                color: AppTheme.primarySwatch[400],
              ),
              alignment: PlaceholderAlignment.middle,
            ),
            TextSpan(
              text: " " + license,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: AppTheme.primarySwatch[400]),
            )
          ]))
        ],
      ),
    );
  }

  Widget _buildImageDownloadsButton() {
    List<Widget> _downloadButton() {
      if (_loading) {
        return List.of([
          const CircularProgressIndicator(
            color: Colors.white,
          )
        ]);
      } else {
        return List.of([const Text("잠금/배경화면 설정")]);
      }
    }

    return ElevatedButton(
        onPressed: () async {
          log("ElevatedButton >>");
          if (Platform.isIOS) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(content: Text("ios는 지원하지 않습니다."), actions: [
                  TextButton(
                      onPressed: () => () {
                            Navigator.pop(context, '확인');
                          },
                      child: Text("확인"))
                ]);
              },
            );
            return;
          }

          final permission = await _permission(viewmodel.imageUrl());
          if (permission) {
            setWallpaperFromFile(viewmodel.imageUrl());
          }
        },
        style: ElevatedButton.styleFrom(
            elevation: 0,
            // primary: Colors.red,
            fixedSize: const Size(double.maxFinite, 60),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(2),
            ))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _downloadButton(),
        ));
  }

  bool _loading = false;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> setWallpaperFromFile(String url) async {
    void complete() async {
      await Future.delayed(
        const Duration(milliseconds: 500),
        () {
          _loading = false;
          log("DataDone post");
          setState(() {});
        },
      );
    }

    setState(() {
      _loading = true;
    });
    final path = await Media.imageDownloadProgress(url);
    complete();

    var myFile = File(path!);

    WallpaperManagerFlutter()
        .setwallpaperfromFile(myFile, WallpaperManagerFlutter.HOME_SCREEN);
    WallpaperManagerFlutter()
        .setwallpaperfromFile(myFile, WallpaperManagerFlutter.LOCK_SCREEN);
  }

  Future<bool> _permission(String url) async {
    void _openAndroidAppDetails() {
      AppSettings.openAppSettings();
    }

    final status = await Permission.storage.request();
    log("ElevatedButton >> $status");
    if (status == PermissionStatus.granted) {
      return true;
    } else {
      log("ElevatedButton >> call");
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("권한 설정"),
            content: Container(
              child: Text("권한 설정해야 사용 가능합니다. 권한 설정 화면으로 이동하시겠습니까?"),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, '확인');
                    _openAndroidAppDetails();
                  },
                  child: const Text("확인"))
            ],
          );
        },
      );
      return false;
    }
  }
}

class PhotoDetailsArguments {
  final Result arguments;

  PhotoDetailsArguments(this.arguments);
}

class Media {
  static Future<String?> imageDownloadProgress(
    String url, {
    String imageName = 'myimage',
  }) async {
    try {
      final imagePath = downloads(url);
      log("imagePath >>> $imagePath");

      return imagePath;
    } on PlatformException catch (error) {
      log("#>> $error");
    }
    return "";
  }

  static Future<String> downloads(String url,
      {String fileSufix = "jpg", String dirName = "mksh"}) async {
    final response = await get(Uri.parse(url));
    final buffer = response.bodyBytes.buffer;
    final byteData = ByteData.view(buffer);

    final folderPath = await createFolder("mklsh");

    final dateFileName =
        DateFormat("yyy-MM-dd hh:mm:ss").format(DateTime.now());

    log("folderPath >> $folderPath");

    final file = File("${folderPath}/${dateFileName}.${fileSufix}");

    await file.writeAsBytes(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    log("downloads >> ${file.path}");

    return file.path;
  }

  static Future<String> createFolder(String cow) async {
    final dir = Directory(
        '${(Platform.isAndroid ? await getExternalStorageDirectory() //FOR ANDROID
                : await getApplicationSupportDirectory() //FOR IOS
            )!.path}/$cow');
    if ((await dir.exists())) {
      return dir.path;
    } else {
      dir.create(recursive: true);
      return dir.path;
    }
  }
}
