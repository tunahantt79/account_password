import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class InfoPage extends StatefulWidget {
  final String appbarTitle;
  final String image;
  final String info;
  const InfoPage(
      {super.key,
      required this.appbarTitle,
      required this.image,
      required this.info});

  @override
  State<InfoPage> createState() => _DetayPageState();
}

class _DetayPageState extends State<InfoPage> {
  final _screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: _screenshotController,
      child: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(widget.appbarTitle),
            actions: [
              IconButton(
                  onPressed: () async {
                    final image =
                        await _screenshotController.captureFromWidget(Container(
                      color: Colors.blueGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 2,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    color: Colors.white,
                                    child: Image.network(widget.image),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, bottom: 25),
                                  child: Text(
                                    widget.info,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));

                    saveAndShare(image);
                  },
                  icon: const Icon(Icons.ios_share))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        color: Colors.white,
                        child: Image.network(widget.image),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 25),
                      child: Text(
                        widget.info,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

Future saveAndShare(Uint8List bytes) async {
  final directory = await getApplicationDocumentsDirectory();
  final image = File('${directory.path}/flutter.png');
  image.writeAsBytesSync(bytes);
  const text = 'SS';
  await Share.shareFiles([image.path], text: text);
}

Future<String> saveImage(Uint8List bytes) async {
  await [Permission.storage].request();
  const name = 'screenshot';
  final result = await ImageGallerySaver.saveImage(bytes, name: name);
  return result['filePath'];
}
