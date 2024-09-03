import 'package:camera/camera.dart';
import 'package:euclidean_face_recog/locator.dart';
import 'package:euclidean_face_recog/services/camera.service.dart';
import 'package:euclidean_face_recog/services/face_detector_service.dart';
import 'package:euclidean_face_recog/widgets/face_painter.dart';
import 'package:flutter/material.dart';

class CameraDetectionPreview extends StatelessWidget {
  CameraDetectionPreview({super.key, this.detectedName});

  final String? detectedName;

  final CameraService _cameraService = locator<CameraService>();
  final FaceDetectorService _faceDetectorService =
      locator<FaceDetectorService>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Transform.scale(
      scale: 1.0,
      child: AspectRatio(
        aspectRatio: MediaQuery.of(context).size.aspectRatio,
        child: OverflowBox(
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: SizedBox(
              width: width,
              height:
                  width * _cameraService.cameraController!.value.aspectRatio,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  CameraPreview(_cameraService.cameraController!),
                  if (_faceDetectorService.faceDetected)
                    CustomPaint(
                      painter: FacePainter(
                          face: _faceDetectorService.faces[0],
                          imageSize: _cameraService.getImageSize(),
                          detectedName: detectedName ?? "Unknown",
                          showPredictedName: true),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
