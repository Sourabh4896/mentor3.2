class AppStrings {
  // General
  static const String appName = 'Face Authentication App';
  static const String welcomeMessage = 'Welcome to Face Authentication App';
  static const String continueLabel = 'Continue';
  static const String cancelLabel = 'Cancel';
  static const String backLabel = 'Back';
  static const String nextLabel = 'Next';
  static const String verifyLabel = 'Verify';

  // Auth
  static const String enrollPageTitle = 'Enroll Face';
  static const String enrollPageDescription =
      'Please take your picture to enroll for face recognition.';
  static const String verifyPageTitle = 'Verify Face';
  static const String verifyPageDescription =
      'Please position your face within the frame to verify your identity.';

  // Settings
  static const String settingsPageTitle = 'Settings';
  static const String updateProfileTitle = 'Update Profile';
  static const String changePasswordTitle = 'Change Password';
  static const String enableFaceVerificationTitle = 'Enable Face Verification';
  static const String notificationsTitle = 'Notifications';
  static const String languageSettingsTitle = 'Language Settings';
  static const String logoutTitle = 'Logout';

  // Security
  static const String securityTitle = 'Security Settings';
  static const String changePasswordDescription =
      'Change your password for better security.';
  static const String enableFaceVerificationDescription =
      'Enable face recognition for faster and secure login.';

  // Error Messages
  static const String errorGeneral = 'An error occurred. Please try again.';
  static const String errorNetwork = 'Network error. Please check your connection.';
  static const String errorFaceRecognition = 'Face recognition failed. Try again.';
  static const String errorUnauthorized = 'Unauthorized access. Please log in again.';
  
  // Success Messages
  static const String successProfileUpdated = 'Profile updated successfully.';
  static const String successPasswordChanged = 'Password changed successfully.';
  static const String successFaceVerificationEnabled =
      'Face verification enabled successfully.';

  // Profile
  static const String profileTitle = 'Profile';
  static const String profileUsernameLabel = 'Username';
  static const String profileEmailLabel = 'Email';
  static const String profilePhoneNumberLabel = 'Phone Number';
  static const String profileAddressLabel = 'Address';

  // Miscellaneous
  static const String appVersion = '1.0.0';
  static const String privacyPolicy = 'Privacy Policy';
  static const String termsOfService = 'Terms of Service';
  static const String contactUs = 'Contact Us';
  
  // UI Text
  static const String faceEnrollment = 'Face Enrollment';
  static const String faceVerification = 'Face Verification';
  static const String faceRecognitionInstructions =
      'Position your face inside the frame for accurate recognition.';
  static const String verifyInstructions = 'Please take a selfie for verification.';
  static const String faceScanSuccess = 'Face scan successful.';
  static const String faceScanFailed = 'Face scan failed. Please try again.';

  // Button Text
  static const String startButton = 'Start';
  static const String verifyButton = 'Verify';
  static const String enrollButton = 'Enroll';
  static const String cancelButton = 'Cancel';

  // Login / Authentication
  static const String login = 'Login';
  static const String register = 'Register';
  static const String forgotPassword = 'Forgot Password';
  static const String resetPassword = 'Reset Password';
  static const String signInWithFace = 'Sign in with Face Recognition';
  
  // Validation Messages
  static const String emailRequired = 'Email is required';
  static const String passwordRequired = 'Password is required';
  static const String passwordTooShort = 'Password must be at least 6 characters';
  static const String invalidEmail = 'Please enter a valid email address';
  static const String usernameRequired = 'Username is required';

  // Face Recognition
  static const String faceRecognitionProcessing = 'Processing face recognition...';
  static const String faceRecognitionError = 'Error recognizing face. Please try again.';
  static const String faceRecognitionRetry = 'Retry Face Recognition';
}
