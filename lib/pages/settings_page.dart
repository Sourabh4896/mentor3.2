import 'package:flutter/material.dart';

/// SettingsPage allows users to manage app preferences and settings.
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Section: User Information
            _buildSectionTitle('User Information'),
            _buildListTile(
              context,
              icon: Icons.account_circle,
              title: 'Update Profile',
              onTap: () {
                // Handle Update Profile
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Update Profile functionality coming soon!')),
                );
              },
            ),
            const Divider(),

            // Section: Security Settings
            _buildSectionTitle('Security'),
            _buildListTile(
              context,
              icon: Icons.lock,
              title: 'Change Password',
              onTap: () {
                // Handle Change Password
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Change Password functionality coming soon!')),
                );
              },
            ),
            _buildListTile(
              context,
              icon: Icons.fingerprint,
              title: 'Enable Face Verification',
              onTap: () {
                // Handle Enable Face Verification
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Enable Face Verification functionality coming soon!')),
                );
              },
            ),
            const Divider(),

            // Section: Preferences
            _buildSectionTitle('Preferences'),
            _buildListTile(
              context,
              icon: Icons.notifications,
              title: 'Notifications',
              onTap: () {
                // Handle Notifications
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Notification settings functionality coming soon!')),
                );
              },
            ),
            _buildListTile(
              context,
              icon: Icons.language,
              title: 'Language Settings',
              onTap: () {
                // Handle Language Settings
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Language Settings functionality coming soon!')),
                );
              },
            ),
            const Divider(),

            // Section: Logout Option
            _buildListTile(
              context,
              icon: Icons.exit_to_app,
              title: 'Logout',
              onTap: () {
                // Handle Logout
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logout functionality coming soon!')),
                );
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  /// Helper method to create a section title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  /// Helper method to create a list tile for each setting option
  Widget _buildListTile(BuildContext context, {
    required IconData icon,
    required String title,
    required Function onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => onTap(),
    );
  }
}
