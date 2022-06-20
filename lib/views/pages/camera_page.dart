// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:app_clone_whatsapp/views/pages/video_preview_page.dart';
import 'package:app_clone_whatsapp/views/theme/pallete.dart';
import 'package:app_clone_whatsapp/views/pages/camera_preview_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> with WidgetsBindingObserver {
  late CameraController _cameraController;
  late Future<void> cameraValue;
  bool isRecoring = false;
  bool flash = false;
  bool isCameraFront = true;
  double transform = 0;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        FutureBuilder(
          future: cameraValue,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: CameraPreview(_cameraController));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        Positioned(
          bottom: 0.0,
          child: Container(
            color: black,
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            flash = !flash;
                          });
                          flash
                              ? _cameraController.setFlashMode(FlashMode.torch)
                              : _cameraController.setFlashMode(FlashMode.off);
                        },
                        icon: Icon(flash ? Icons.flash_on : Icons.flash_off,
                            color: white, size: 28)),
                    GestureDetector(
                      onLongPress: () async {
                        await _cameraController.startVideoRecording();
                        setState(() {
                          isRecoring = true;
                        });
                      },
                      onLongPressUp: () async {
                        XFile videoPath =
                            await _cameraController.stopVideoRecording();
                        setState(() {
                          isRecoring = false;
                        });

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) =>
                                    VideoPreviewPage(path: videoPath.path)));
                      },
                      onTap: () {
                        if (!isRecoring) {
                          takePhoto(context);
                        }
                      },
                      child: isRecoring
                          ? const Icon(Icons.radio_button_on,
                              color: red, size: 80)
                          : const Icon(Icons.panorama_fish_eye,
                              color: white, size: 70),
                    ),
                    IconButton(
                        onPressed: () async {
                          setState(() {
                            isCameraFront = !isCameraFront;
                            transform = transform + pi;
                          });

                          int cameraPos = isCameraFront ? 0 : 1;
                          _cameraController = CameraController(
                              cameras[cameraPos], ResolutionPreset.high);
                          cameraValue = _cameraController.initialize();
                        },
                        icon: Transform.rotate(
                          angle: transform,
                          child: const Icon(Icons.flip_camera_ios,
                              color: white, size: 28),
                        ))
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Hold for video, tap for photo',
                  style: TextStyle(color: white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }

  void takePhoto(BuildContext context) async {
    XFile file = await _cameraController.takePicture();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => CameraPreviewPage(path: file.path)));
  }
}
