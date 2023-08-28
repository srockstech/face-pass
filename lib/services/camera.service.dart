import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class CameraService {
  // singleton boilerplate
  static final CameraService _cameraServiceService = CameraService._internal();

  factory CameraService() {
    return _cameraServiceService;
  }
  // singleton boilerplate
  CameraService._internal();

  CameraController? _cameraController;
  CameraController get cameraController => this._cameraController!;

  CameraDescription? _cameraDescription;

  InputImageRotation? _cameraRotation;
  InputImageRotation get cameraRotation => this._cameraRotation!;

  String? _imagePath;
  String get imagePath => this._imagePath!;

  Future startService(CameraDescription cameraDescription) async {
    this._cameraDescription = cameraDescription;
    this._cameraController = CameraController(
      this._cameraDescription!,
      ResolutionPreset.high,
      enableAudio: false,
    );

    // sets the rotation of the image
    this._cameraRotation = rotationIntToImageRotation(
      this._cameraDescription!.sensorOrientation,
    );

    // Next, initialize the controller. This returns a Future.
    return this._cameraController!.initialize();
  }

  InputImageRotation rotationIntToImageRotation(int rotation) {
    switch (rotation) {
      case 90:
        return InputImageRotation.rotation90deg;
      case 180:
        return InputImageRotation.rotation180deg;
      case 270:
        return InputImageRotation.rotation270deg;
      default:
        return InputImageRotation.rotation0deg;
    }
  }

  /// takes the picture and saves it in the given path 📸
  Future<XFile> takePicture() async {
    XFile file = await _cameraController!.takePicture();
    this._imagePath = file.path;
    return file;
  }

  /// returns the image size 📏
  Size getImageSize() {
    return Size(
      _cameraController!.value.previewSize!.height,
      _cameraController!.value.previewSize!.width,
    );
  }

  dispose() {
    this._cameraController!.dispose();
  }
}
