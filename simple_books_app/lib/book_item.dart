import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final int index;

  const BookItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Center(
        child: Text(
          'Book ${index + 1}',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.black,
              ),
        ),
      ),
    );
  }
}
