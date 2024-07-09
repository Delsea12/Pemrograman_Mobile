
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
          'Horror',
          'Historical Fiction',
          'Short Story',
          'Philosophy',
          'Humor',
          'Science Fiction',
          'Astrology',
          'Astronomy',
        ],
        imagePath: 'assets/images',
        imageHeight: 100,
      ),
    );
  }
}
