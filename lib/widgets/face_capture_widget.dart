import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

/// FaceCaptureWidget is responsible for capturing a face image using the camera.
class FaceCaptureWidget extends StatefulWidget {
  final Function(XFile) onImageCaptured; // Callback to handle the captured image

  const FaceCaptureWidget({super.key, required this.onImageCaptured});

  @override
  _FaceCaptureWidgetState createState() => _FaceCaptureWidgetState();
}

class _FaceCaptureWidgetState extends State<FaceCaptureWidget> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isCapturing = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  /// Initializes the camera.
  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(firstCamera, ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
  }

  /// Captures the image and passes it to the parent widget.
  Future<void> _captureImage() async {
    setState(() {
      _isCapturing = true;
    });

    try {
      await _initializeControllerFuture;
      final XFile image = await _controller.takePicture();
      widget.onImageCaptured(image); // Pass the captured image to the parent widget
    } catch (e) {
      setState(() {
        _isCapturing = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to capture image: $e')),
      );
    }

    setState(() {
      _isCapturing = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Camera Preview
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: CameraPreview(_controller),
                ),
              ),
              const SizedBox(height: 20),
              // Capture Button
              ElevatedButton(
                onPressed: _isCapturing ? null : _captureImage,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                ),
                child: _isCapturing
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Icon(Icons.camera_alt, size: 30),
              ),
            ],
          );
        }
      },
    );
  }
}
