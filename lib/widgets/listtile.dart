import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login_screen.dart';

class CustomMenu extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Profile', 'color': Colors.pink},
    {'title': 'Library', 'color': Colors.green},
    {'title': 'Tasbeeh', 'color': Colors.orange},
    {'title': 'Qibla Direction', 'color': Colors.purple},
    {'title': 'Salah', 'color': Colors.red},
    {'title': 'Delete Account', 'color': Colors.blue},
    {'title': 'Login', 'color': Colors.pink},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: menuItems.map((item) => buildMenuItem(item,context)).toList(),
    );
  }

  Widget buildMenuItem(Map<String, dynamic> item,BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: InkWell(
        onTap: (){
          if(item['title']=='Login'){
            Navigator.push(ctx, CupertinoPageRoute(builder: (ctx)=>LoginScreen()));
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const SizedBox(width: 8,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Container(
                  width: 4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: item['color'],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  item['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 16,
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}