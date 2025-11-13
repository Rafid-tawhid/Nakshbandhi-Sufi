import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nakshbandhi/widgets/listtile.dart';

//
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Image.asset('images/settings.png',height: 160,width: 160,),
          ),
          CustomMenu()
          // _buildSettingsItem('Profile', Icons.person),
          // _buildSettingsItem('Library', Icons.library_books),
          // _buildSettingsItem('Tasbeeh', Icons.assessment),
          // _buildSettingsItem('Qibla Direction', Icons.explore),
          // _buildSettingsItem('Salah', Icons.access_time),
          // _buildSettingsItem('Delete Account', Icons.delete, color: Colors.red),
          // _buildSettingsItem('Login', Icons.login),
        ],
      ),

    );
  }

  Widget _buildSettingsItem(String title, IconData icon, {Color color = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12)
        ),
        child: ListTile(
         // tileColor: Colors.grey.shade100,
          //contentPadding: EdgeInsets.zero,
          leading: Icon(icon, color: color),
          title: Text(title, style: TextStyle(color: color)),
          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: color),
          onTap: () {
            // Handle item tap
          },
        ),
      ),
    );
  }
}