import 'dart:io';

import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transparent_image/transparent_image.dart'
    show kTransparentImage;
import 'package:flutter/material.dart';

class GoogleMLKitExample extends StatefulWidget {
  const GoogleMLKitExample({super.key});

  @override
  _GoogleMLKitExampleState createState() => _GoogleMLKitExampleState();
}

class _GoogleMLKitExampleState extends State<GoogleMLKitExample> {
  File? _imageFile;
  final _picker = ImagePicker();

  Future<bool> _pickImage() async {
    setState(() => _imageFile = null);
    final File? imageFile = await showDialog<File>(
      context: context,
      builder: (ctx) => SimpleDialog(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take picture'),
            onTap: () async {
              final XFile? pickedFile =
                  await _picker.pickImage(source: ImageSource.camera);
              if (mounted && pickedFile != null) {
                Navigator.pop(ctx, File(pickedFile.path));
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Pick from gallery'),
            onTap: () async {
              try {
                final XFile? pickedFile =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (mounted && pickedFile != null) {
                  Navigator.pop(ctx, File(pickedFile.path));
                }
              } catch (e) {
                print(e);
                Navigator.pop(ctx, null);
              }
            },
          ),
        ],
      ),
    );
    if (mounted && imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please pick one image first.')),
      );
      return false;
    }
    setState(() => this._imageFile = imageFile);
    print('picked image: ${this._imageFile}');
    return true;
  }

  Future<void> _imageLabelling() async {
    if (await _pickImage() == false) {
      return;
    }
    String result = '';
    final InputImage inputImage = InputImage.fromFile(this._imageFile!);
    final ImageLabeler imageLabeler = GoogleMlKit.vision.imageLabeler();
    final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);
    result += 'Detected ${labels.length} labels.\n';
    for (final ImageLabel label in labels) {
      final String text = label.label;
      final int entityId = label.index;
      final double confidence = label.confidence;
      result +=
          '\n#Label: $text($entityId), confidence=${confidence.toStringAsFixed(3)}';
    }
    if (result.isNotEmpty) {}
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        if (_imageFile == null)
          Container(
            height: 250,
            child: const Icon(
              Icons.account_circle,
              size: 100,
            ),
          )
        else
          SizedBox(
            height: 250,
            width: 250,
            child: CircleAvatar(
              foregroundImage: MemoryImage(kTransparentImage),
              backgroundImage: FileImage(_imageFile!),
              // Image.file(, fit: BoxFit.contain),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                backgroundColor: Colors.grey),
            onPressed: this._imageLabelling,
            child: const Text('Fotoğraf Ekle'),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
