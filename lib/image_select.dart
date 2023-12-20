import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';

class ImageSelect extends StatefulWidget {
  const ImageSelect({super.key});

  @override
  State<ImageSelect> createState() => _ImageSelectState();
}

class _ImageSelectState extends State<ImageSelect> {

  File? _selectedImage;


  Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;

    File? imagePath = File(returnedImage.path);
    imagePath = await _cropImage(imageFile: imagePath);
    setState(() {
      _selectedImage = imagePath;
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;

    File? imagePath = File(returnedImage.path);
    imagePath = await _cropImage(imageFile: imagePath);
    setState(() {
      _selectedImage = imagePath;
    });
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: imageFile.path);

    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;

    return SizedBox(
      width: screenSize.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _pickImageFromGallery();
              },
              style: ElevatedButton.styleFrom(
                  maximumSize: Size(screenSize.width * 0.8, 50),
                  foregroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  )
              ),
              child: Text("Browse Gallery"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _pickImageFromCamera();
              },
              style: ElevatedButton.styleFrom(
                  maximumSize: Size(screenSize.width * 0.8, 50),
                  foregroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  )
              ),
              child: Text("Open Camera"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _selectedImage != null ? Image.file(_selectedImage!) : Text(
                "Pick Image"),
          ),
        ],
      ),
    );
  }
}
