import 'package:flutter/material.dart';
import 'package:simple_books_app/detail_page.dart'; // Import halaman baru

class BookListPage extends StatelessWidget {
  final String pageTitle;
  final List<String> bookTitles;
  final String imagePath;
  final double imageHeight;

  const BookListPage({
    Key? key,
    required this.pageTitle,
    required this.bookTitles,
    required this.imagePath,
    required this.imageHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: bookTitles.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildBookItem(context, index);
        },
      ),
    );
  }

  Widget _buildBookItem(BuildContext context, int index) {
    return Card(
      elevation: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/Book_${index + 1}.jpeg', // Jalur file gambar dengan indeks
            height: 100, // Tinggi gambar
            width: double.infinity, // Lebar gambar mengisi seluruh card
            fit: BoxFit.cover, // Menyesuaikan gambar dengan ukuran card
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              bookTitles[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          ElevatedButton(
            // Tambahkan tombol
            onPressed: () {
              _navigateToBookDetailPage(
                  context,
                  bookTitles[
                      index]); // Navigasi ke halaman baru dengan judul buku
            },
            child: const Text('View Details'),
          ),
        ],
      ),
    );
  }

  void _navigateToBookDetailPage(BuildContext context, String bookTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailPage(
            bookTitle: bookTitle), // Navigasi ke halaman baru dengan judul buku
      ),
    );
  }
}
