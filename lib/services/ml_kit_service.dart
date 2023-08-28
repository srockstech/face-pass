import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import 'camera.service.dart';

class MLKitService {
  // singleton boilerplate
  static final MLKitService _cameraServiceService = MLKitService._internal();

  factory MLKitService() {
    return _cameraServiceService;
  }
  // singleton boilerplate
  MLKitService._internal();

  // service injection
  CameraService _cameraService = CameraService();

  FaceDetector? _faceDetector;
  FaceDetector get faceDetector => this._faceDetector!;

  void initialize() {
    this._faceDetector = GoogleMlKit.vision.faceDetector(
      FaceDetectorOptions(
        performanceMode: FaceDetectorMode.accurate,
      ),
    );
  }

  Future<List<Face>> getFacesFromImage(CameraImage image) async {
    /// preprocess the image  🧑🏻‍🔧
    InputImageMetadata _firebaseImageMetadata = InputImageMetadata(
      rotation: _cameraService.cameraRotation,
      format: InputImageFormatValue.fromRawValue(image.format.raw)!,
      size: Size(image.width.toDouble(), image.height.toDouble()),
      bytesPerRow: image.planes.first.bytesPerRow,
      // planeData: image.planes.map(
      //   (Plane plane) {
      //     return InputImageMetadata(
      //       bytesPerRow: plane.bytesPerRow,
      //
      //       height: plane.height,
      //       width: plane.width,
      //     );
      //   },
      // ).toList()[0],
    );

    /// Transform the image input for the _faceDetector 🎯
    InputImage _firebaseVisionImage = InputImage.fromBytes(
      bytes: image.planes[0].bytes,
      metadata: _firebaseImageMetadata,
    );

    /// process the image and makes inference 🤖
    List<Face> faces =
        await this._faceDetector!.processImage(_firebaseVisionImage);
    return faces;
  }
}
