import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NAQSHBANDI SUFI'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Explore Our Gatherings section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Explore Our Gatherings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('See all'),
                ),
              ],
            ),
            SizedBox(height: 8),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'There are no upcoming gatherings at the moment.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Divider(height: 40, thickness: 1),

            // News Feed section
            Text(
              'News Feed',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),

            // First news item
            _buildNewsItem(
              title: 'Naqshbandi Sufi',
              date: '5th Apr 2025',
              eventTitle: 'Milad-un-Nabi',
              location: 'Sar Suba Shah, PK | Tuesday 8th April 2025',
            ),
            Divider(),
            SizedBox(height: 16),

            // Second news item
            _buildNewsItem(
              title: 'Naqshbandi Sufi',
              date: '5th Apr 2025',
              eventTitle: 'Annual Milad-un-Nabi',
              location: 'Shan-e-Siddiq-e-Akbar',
              showSeeMore: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsItem({
    required String title,
    required String date,
    required String eventTitle,
    required String location,
    bool showSeeMore = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              date,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          eventTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(location),
        if (showSeeMore)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text('See more'),
            ),
          ),
      ],
    );
  }
}