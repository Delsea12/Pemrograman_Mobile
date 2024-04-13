import 'package:flutter/material.dart';

class BookDetailPage extends StatefulWidget {
  final String bookTitle;

  const BookDetailPage({Key? key, required this.bookTitle}) : super(key: key);

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  // Menyimpan detail buku berdasarkan judul
  Map<String, BookDetail> bookDetails = {
    'Book 1': BookDetail(
      author: 'Keisha Ervin',
      publishedDate: 'January 1, 2023',
      genre: 'Poetry',
      description: 'Description of Book 1.',
    ),
    'Book 2': BookDetail(
      author: 'Bj Habibie',
      publishedDate: 'Maret 2, 2023',
      genre: 'Astronomy',
      description: 'Description of Book 2.',
    ),
    'Book 3': BookDetail(
      author: 'Author 2',
      publishedDate: 'February 1, 2023',
      genre: 'Non-Fiction',
      description: 'Description of Book 2.',
    ),
    'Book 4': BookDetail(
      author: 'Author 2',
      publishedDate: 'February 1, 2023',
      genre: 'Non-Fiction',
      description: 'Description of Book 2.',
    ),
    'Book 5': BookDetail(
      author: 'Author 2',
      publishedDate: 'February 1, 2023',
      genre: 'Non-Fiction',
      description: 'Description of Book 2.',
    ),
    'Book 6': BookDetail(
      author: 'Author 2',
      publishedDate: 'February 1, 2023',
      genre: 'Non-Fiction',
      description: 'Description of Book 2.',
    ),
    'Book 7': BookDetail(
      author: 'Author 2',
      publishedDate: 'February 1, 2023',
      genre: 'Non-Fiction',
      description: 'Description of Book 2.',
    ),
    'Book 8': BookDetail(
      author: 'Author 2',
      publishedDate: 'February 1, 2023',
      genre: 'Non-Fiction',
      description: 'Description of Book 2.',
    ),
    'Book 9': BookDetail(
      author: 'Author 2',
      publishedDate: 'February 1, 2023',
      genre: 'Non-Fiction',
      description: 'Description of Book 2.',
    ),
    'Book 10': BookDetail(
      author: 'Author 2',
      publishedDate: 'February 1, 2023',
      genre: 'Non-Fiction',
      description: 'Description of Book 2.',
    ),
    // Tambahkan detail untuk setiap judul buku lainnya di sini
  };

  @override
  Widget build(BuildContext context) {
    // Dapatkan detail buku berdasarkan judul yang dipilih
    BookDetail detail = bookDetails[widget.bookTitle] ?? BookDetail();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Detail'), // Judul halaman detail buku
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detail for ${widget.bookTitle}', // Menampilkan judul buku yang dipilih
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Author: ${detail.author}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Published: ${detail.publishedDate}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Genre: ${detail.genre}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Description: ${detail.description}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

// Kelas untuk menyimpan detail buku
class BookDetail {
  final String author;
  final String publishedDate;
  final String genre;
  final String description;

  BookDetail({
    this.author = '',
    this.publishedDate = '',
    this.genre = '',
    this.description = '',
  });
}
