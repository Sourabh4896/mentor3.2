import 'package:flutter/material.dart';
import 'pages/auth/enroll_page.dart';
import 'pages/auth/verify_page.dart';
import 'pages/settings_page.dart';  // Import the SettingsPage

void main() {
  runApp(MyApp());
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Face Authenticator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/enroll': (context) => EnrollPage(),
        '/verify': (context) => VerifyPage(),
        '/settings': (context) => SettingsPage(),  // Route for SettingsPage
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

/// HomePage widget serves as the main entry point after launching the app.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Authenticator'),
        actions: [
          // Add Settings button in the app bar
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/enroll'),
              child: const Text('Enroll Face'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/verify'),
              child: const Text('Verify Face'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              child: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
