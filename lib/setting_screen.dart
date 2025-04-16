import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildSettingsItem('Profile', Icons.person),
          _buildSettingsItem('Library', Icons.library_books),
          _buildSettingsItem('Tasbeeh', Icons.assessment),
          _buildSettingsItem('Qibla Direction', Icons.explore),
          _buildSettingsItem('Salah', Icons.access_time),
          _buildSettingsItem('Delete Account', Icons.delete, color: Colors.red),
          _buildSettingsItem('Login', Icons.login),
        ],
      ),

    );
  }

  Widget _buildSettingsItem(String title, IconData icon, {Color color = Colors.black}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: color),
      onTap: () {
        // Handle item tap
      },
    );
  }
}