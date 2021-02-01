
import 'dart:io';

import 'package:TARA/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File _selectedFile;
  bool _inProcess = false;
  TextEditingController cTitle = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      body: _imageload(),
    );
  }

  Widget _imageload() {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10),
              _textFoto(),
              SizedBox(height: 30),
              getImageWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        getImage(ImageSource.camera);
                      },
                      child: Icon(Icons.camera_alt,
                          size: 50, color: DeliveryColors.green),
                      splashColor: DeliveryColors.lightGrey,
                      color: Colors.transparent,
                      elevation: 0,
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                        onPressed: () {
                        getImage(ImageSource.gallery);
                      },
                      child: Icon(Icons.image,
                          size: 50, color: DeliveryColors.green),
                      splashColor: DeliveryColors.dark,
                      color: Colors.transparent,
                      elevation: 0,
                    ),
                  ),
                ],
              )
            ],
          ),
          (_inProcess)
              ? Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.95,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Center(),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _textFoto() {
    return Center(
        child: Text(
      'Sube tu foto de perfil',
      /*style: styleTitleBlack*/
      style: TextStyle(
          color: DeliveryColors.dark,
          fontSize: 22.0,
          fontWeight: FontWeight.bold),
    ));
  }

  Widget getImageWidget() {
    if (_selectedFile != null) {
      return Image.file(
        _selectedFile,
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        "assets/img/.png",
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      );
    }
  }

  getImage(ImageSource source) async {
    this.setState(() {
      _inProcess = true;
    });
    File image = await ImagePicker.pickImage(source: source);
    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: DeliveryColors.brown,
            toolbarTitle: "INMOBIT",
            statusBarColor: DeliveryColors.green,
            backgroundColor: DeliveryColors.green,
          ));

      this.setState(() {
        _selectedFile = cropped;
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
}
