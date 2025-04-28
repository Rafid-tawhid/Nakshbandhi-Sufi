import 'package:flutter/material.dart';

class HadithLibraryScreen extends StatelessWidget {
  final List<HadithBook> books = [
    HadithBook(
      title: 'Sahih al-Bukhari',
      author: 'Imam Bukhari',
      pages: 7560,
      size: '15.2 MB',
      downloadUrl: 'https://example.com/bukhari.pdf',
      imageUrl: 'https://i.ibb.co/0jQ5Z0T/bukhari.jpg',
    ),
    HadithBook(
      title: 'Sahih Muslim',
      author: 'Imam Muslim',
      pages: 5362,
      size: '12.8 MB',
      downloadUrl: 'https://example.com/muslim.pdf',
      imageUrl: 'https://i.ibb.co/4W2yZnz/muslim.jpg',
    ),
    HadithBook(
      title: 'Sunan Abu Dawood',
      author: 'Imam Abu Dawood',
      pages: 4590,
      size: '10.5 MB',
      downloadUrl: 'https://example.com/abudawood.pdf',
      imageUrl: 'https://i.ibb.co/3Yf3Z3J/abudawood.jpg',
    ),
    HadithBook(
      title: 'Jami at-Tirmidhi',
      author: 'Imam Tirmidhi',
      pages: 3956,
      size: '9.1 MB',
      downloadUrl: 'https://example.com/tirmidhi.pdf',
      imageUrl: 'https://i.ibb.co/6nZ1L3G/tirmidhi.jpg',
    ),
    HadithBook(
      title: 'Sunan an-Nasa\'i',
      author: 'Imam Nasa\'i',
      pages: 5760,
      size: '13.4 MB',
      downloadUrl: 'https://example.com/nasai.pdf',
      imageUrl: 'https://i.ibb.co/4W2yZnz/nasai.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hadith Library'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return _buildBookCard(books[index]);
        },
      ),
    );
  }

  Widget _buildBookCard(HadithBook book) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _launchUrl(book.downloadUrl),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Book Cover
              Container(
                width: 80,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage('https://static-01.daraz.com.bd/p/117b5575359824a3c9805821d423e008.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16),

              // Book Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'By ${book.author}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        _buildInfoChip(Icons.menu_book, '${book.pages} pages'),
                        SizedBox(width: 8),
                        _buildInfoChip(Icons.sd_storage, book.size),
                      ],
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () => _launchUrl(book.downloadUrl),
                      child: Text('Download PDF',style: TextStyle(color: Colors.black),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.grey[600]),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }
}

class HadithBook {
  final String title;
  final String author;
  final int pages;
  final String size;
  final String downloadUrl;
  final String imageUrl;

  HadithBook({
    required this.title,
    required this.author,
    required this.pages,
    required this.size,
    required this.downloadUrl,
    required this.imageUrl,
  });
}