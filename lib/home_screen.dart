import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class NewsFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('NAQSHBANDI SUFI®',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Explore Our Gatherings',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('See all ➤', style: TextStyle(color: Colors.blue)),
              ],
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text('There are no upcoming gatherings at the moment.',
                    style: TextStyle(color: Colors.grey[600])),
              ),
            ),
            SizedBox(height: 24),

            // News Feed Title
            const Text('News Feed',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            // Post 1
            _buildPostCard(
              title: 'Naqshbandi Sufi',
              date: '5th Apr 2025',
              imageUrl:
                  'https://static-01.daraz.com.bd/p/117b5575359824a3c9805821d423e008.jpg',
            ),
            SizedBox(height: 16),

            // Post 2
            _buildPostCard(
              title: 'Milad-un-Nabi 🌟',
              subtitle: 'Sar Suba Shah, PK | Tuesday 8th April 2025',
              imageUrl:
                  'https://static-01.daraz.com.bd/p/117b5575359824a3c9805821d423e008.jpg',
            ),
            SizedBox(height: 16),

            // Post 3
            _buildPostCard(
              title: 'Naqshbandi Sufi',
              date: '5th Apr 2025',
              imageUrl:
                  'https://static-01.daraz.com.bd/p/117b5575359824a3c9805821d423e008.jpg',
            ),
            SizedBox(height: 16),

            // Post 4
            _buildPostCard(
              title: 'Annual Milad-un-Nabi 🌟',
              subtitle: 'Shan-e-Siddiq-e-Akbar 🌟\n...   رضى الله عنه',
              imageUrl: 'https://static-01.daraz.com.bd/p/117b5575359824a3c9805821d423e008.jpg',
              showSeeMore: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostCard({
    required String title,
    String? date,
    String? subtitle,
    required String imageUrl,
    bool showSeeMore = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    if (date != null)
                      Text(date, style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
                SizedBox(height: 8),

                // Subtitle
                if (subtitle != null)
                  Text(subtitle, style: TextStyle(color: Colors.grey[700])),
                SizedBox(height: 8),

                // See More
                if (showSeeMore)
                  Align(
                    alignment: Alignment.centerRight,
                    child:
                        Text('See more', style: TextStyle(color: Colors.blue)),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
