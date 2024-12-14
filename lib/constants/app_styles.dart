import 'package:flutter/material.dart';

/// A collection of constants for the app's styling to maintain consistency across the app.
class AppStyles {
  // **Text Styles**
  static const TextStyle heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black54,
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle labelText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static const TextStyle errorText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.red,
  );

  // **Button Styles**
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white, 
    backgroundColor: Colors.blue, // Button text color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.symmetric(vertical: 16),
    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  );

  static ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: Colors.grey, // Button text color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.symmetric(vertical: 14),
    textStyle: const TextStyle(fontSize: 16),
  );

  static ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: Colors.blue, side: const BorderSide(color: Colors.blue), // Button border color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.symmetric(vertical: 14),
    textStyle: const TextStyle(fontSize: 16),
  );

  // **Input Decoration Styles**
  static InputDecoration textFieldInputDecoration({
    String hintText = '',
    IconData? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppStyles.bodyText,
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.blue),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.blue),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.blue),
      ),
    );
  }

  // **Card Styles**
  static BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.white,
    boxShadow: const [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 4,
        offset: Offset(0, 2),
      ),
    ],
    borderRadius: BorderRadius.circular(12),
  );

  // **General Padding and Margin**
  static const EdgeInsetsGeometry pagePadding = EdgeInsets.all(16.0);
  static const EdgeInsetsGeometry sectionPadding = EdgeInsets.symmetric(vertical: 16.0);
  static const EdgeInsetsGeometry cardPadding = EdgeInsets.all(12.0);

  // **Container Styles**
  static BoxDecoration containerDecoration = BoxDecoration(
    color: Colors.blue[50],
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.blue),
  );
}
