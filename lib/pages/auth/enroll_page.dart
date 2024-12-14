import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:second_evaluation/main.dart';
import './../../widgets/face_capture_widget.dart';

/// EnrollPage allows users to register their facial data.
class EnrollPage extends StatefulWidget {
  const EnrollPage({super.key});

  @override
  _EnrollPageState createState() => _EnrollPageState();
}

class _EnrollPageState extends State<EnrollPage> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  late String _capturedImagePath;
  bool _isImageCaptured = false;

  @override
  void initState() {
    super.initState();
    // Initialize the camera controller
    _initializeCamera();
  }

  // Function to initialize the camera controller
  Future<void> _initializeCamera() async {
    // Get the list of available cameras
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    // Create a CameraController
    _cameraController = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    // Initialize the controller
    _initializeControllerFuture = _cameraController.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    // Dispose of the camera controller when the widget is disposed
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enroll Face'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display captured image if available
                  _isImageCaptured
                      ? CircleAvatar(
                          radius: 100,
                          backgroundImage: FileImage(
                            File(_capturedImagePath),
                          ),
                        )
                      : Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            size: 80,
                            color: Colors.grey[700],
                          ),
                        ),
                  const SizedBox(height: 16),
                  Text(
                    _isImageCaptured
                        ? 'Image Captured. Tap "Enroll" to proceed.'
                        : 'Position your face in the frame and tap "Capture".',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: _isImageCaptured
                  ? () async {
                      // Enroll user logic can be placed here (e.g., send image data to server)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Face enrolled successfully!')),
                      );

                      // After successful enrollment, navigate to the homepage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()), // Replace with your HomePage widget
                      );
                    }
                  : null,
              icon: const Icon(Icons.check),
              label: const Text('Enroll'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
            const SizedBox(height: 16),
            // Face capture widget to take a picture
            FaceCaptureWidget(
              onImageCaptured: (XFile image) async {
                setState(() {
                  _capturedImagePath = image.path;
                  _isImageCaptured = true;
                });

                // You can also store the image securely or encrypt it here
                final directory = await getApplicationDocumentsDirectory();
                final fileName = basename(image.path);
                final savedImage = await image.saveTo('${directory.path}/$fileName');
                print('Image saved at: ${directory.path}/$fileName');
              },
            ),
          ],
        ),
      ),
    );
  }
}
