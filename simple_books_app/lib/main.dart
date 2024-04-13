import 'package:flutter/material.dart';
import 'package:simple_books_app/book_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Book List';

    return const MaterialApp(
      title: title,
      home: BookListPage(
        pageTitle: title,
        bookTitles: [
          'Poetry',
          'Self Improvement',
          'Horor',
          'Hostorical Fiction',
          'Short Story',
          'Philosophy',
          'Humor',
          'Science Fiction',
          'Astrology',
          'Astronomy',
        ],
        imagePath: 'assets/images', // Memberikan nilai imagePath
        imageHeight: 100, // Memberikan nilai imageHeight
      ),
    );
  }
}
