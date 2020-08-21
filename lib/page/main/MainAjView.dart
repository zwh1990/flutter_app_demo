import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:async';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MainAjView extends StatefulWidget {
  @override
  _MainAjViewState createState() => new _MainAjViewState();
}

class _MainAjViewState extends State<MainAjView> {
  File imageFile;

  Divider divider = new Divider(
    color: Colors.blue,
    indent: 10,
    endIndent: 10,
    thickness: 1,
    height: 1,
  );

  @override
  Widget build(BuildContext context) {
    print("案件");
    return Scaffold(
        appBar: AppBar(
          title: Text("案件"),
          centerTitle: true,
          leading: null,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                child: Text(
                  "上传图片:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              GestureDetector(
                child: imageFile != null
                    ? Image.file(
                        imageFile,
                        width: 150,
                        height: 150,
                      )
                    : Image.asset(
                        "images/add_image.png",
                        width: 150,
                        height: 150,
                      ),
                onTap: () async {
                  print("点击图片");
                  int type = await _selectPicture();
                  print(type);
                  if (type == 0) {
                    imageFile = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                    print(imageFile);
                    if (imageFile != null) {
                      _cropImage();
                    }
                  } else if (type == 1) {
                    imageFile =
                        await ImagePicker.pickImage(source: ImageSource.camera);
                    print(imageFile);
                    if (imageFile != null) {
                      _cropImage();
                    }
                  }
                },
              )
            ],
          ),
        ));
  }

  /** int 返回 0 代表相册选取 1代表拍照 2代表取消
   * 选择图片的方式
   */
  Future<int> _selectPicture() {
    print("弹窗");
    return showModalBottomSheet<int>(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "相册选取",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () => {Navigator.of(context).pop(0)},
              ),
              divider,
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "拍照",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () => {Navigator.of(context).pop(1)},
              ),
              divider,
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "取消",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () => {Navigator.of(context).pop(2)},
              )
            ],
          );
        });
  }

  Future<Null> _cropImage() async {
    print("裁剪图片");
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      imageFile = croppedFile;
      setState(() {});
    }
  }
}
