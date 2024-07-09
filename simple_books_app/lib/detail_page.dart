import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookDetailPage extends StatefulWidget {
  final String bookTitle;

  const BookDetailPage({Key? key, required this.bookTitle}) : super(key: key);

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  List<BookDetail> bookDetails = []; // List untuk menyimpan detail buku

  @override
  void initState() {
    super.initState();
    _loadBookDetails();
  }

  // Load existing book details or initialize if none exist
  void _loadBookDetails() {
    // Misalnya, inisialisasi list dengan detail buku
    bookDetails = [
      // BookDetail(
      //   author: 'Keisha Ervin',
      //   publishedDate: 'January 1, 2023',
      //   genre: 'Poetry',
      //   description: 'Description of Book 1.',
      // ),
      // BookDetail(
      //   author: 'Bj Habibie',
      //   publishedDate: 'March 2, 2023',
      //   genre: 'Astronomy',
      //   description: 'Description of Book 2.',
      // ),
    ];
  }

  void _addBook() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddBookDialog(
          onBookAdded: (author, genre, publishDate, description) {
            setState(() {
              bookDetails.add(BookDetail(
                author: author,
                publishedDate: publishDate,
                genre: genre,
                description: description,
              ));
            });
          },
        );
      },
    );
  }

  void _editBook(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditBookDialog(
          initialBook: bookDetails[index],
          onBookUpdated: (author, genre, publishDate, description) {
            setState(() {
              bookDetails[index] = BookDetail(
                author: author,
                publishedDate: publishDate,
                genre: genre,
                description: description,
              );
            });
          },
        );
      },
    );
  }

  void _deleteBook(int index) {
    setState(() {
      bookDetails.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Detail'), // Judul halaman detail buku
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: bookDetails.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text('Book ${index + 1} Details'),
              children: [
                Column(
                  children: [
                    TextFormField(
                      initialValue: bookDetails[index].author,
                      decoration: const InputDecoration(labelText: 'Author'),
                      onChanged: (value) {
                        setState(() {
                          bookDetails[index].author = value;
                        });
                      },
                      textCapitalization: TextCapitalization.none,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      initialValue: bookDetails[index].publishedDate,
                      decoration:
                          const InputDecoration(labelText: 'Published Date'),
                      readOnly: true,
                      onTap: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                colorScheme: ColorScheme.light().copyWith(
                                  primary:
                                      Colors.blue, // Your desired color here
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (pickedDate != null) {
                          setState(() {
                            bookDetails[index].publishedDate =
                                pickedDate.toString().split(' ')[0];
                          });
                        }
                      },
                      textCapitalization: TextCapitalization.none,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      initialValue: bookDetails[index].genre,
                      decoration: const InputDecoration(labelText: 'Genre'),
                      onChanged: (value) {
                        setState(() {
                          bookDetails[index].genre = value;
                        });
                      },
                      textCapitalization: TextCapitalization.none,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      initialValue: bookDetails[index].description,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      onChanged: (value) {
                        setState(() {
                          bookDetails[index].description = value;
                        });
                      },
                      textCapitalization: TextCapitalization.none,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _editBook(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteBook(index),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addBook,
        tooltip: 'Add Book',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Kelas untuk menyimpan detail buku
class BookDetail {
  String author;
  String publishedDate;
  String genre;
  String description;

  BookDetail({
    this.author = '',
    this.publishedDate = '',
    this.genre = '',
    this.description = '',
  });
}

// Widget untuk menampilkan dialog tambah buku
// Widget untuk menampilkan dialog tambah buku
class AddBookDialog extends StatefulWidget {
  final Function(String, String, String, String) onBookAdded;

  const AddBookDialog({Key? key, required this.onBookAdded}) : super(key: key);

  @override
  _AddBookDialogState createState() => _AddBookDialogState();
}

class _AddBookDialogState extends State<AddBookDialog> {
  final _formKey = GlobalKey<FormState>();
  late String _author;
  late String _publishedDate;
  late String _genre;
  late String _description;

  @override
  void initState() {
    super.initState();
    _author = '';
    _publishedDate = '';
    _genre = '';
    _description = '';
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onBookAdded(_author, _genre, _publishedDate, _description);
      Navigator.of(context).pop();
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light().copyWith(
              primary: Colors.blue, // Your desired color here
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        _publishedDate = pickedDate.toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Book'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Author'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the author';
                }
                return null;
              },
              onSaved: (value) {
                _author = value!;
              },
              textCapitalization: TextCapitalization.none,
            ),
            const SizedBox(height: 8),
            TextFormField(
              readOnly: true,
              controller: TextEditingController(text: _publishedDate),
              decoration: const InputDecoration(labelText: 'Published Date'),
              onTap: () => _pickDate(context),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Genre'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the genre';
                }
                return null;
              },
              onSaved: (value) {
                _genre = value!;
              },
              textCapitalization: TextCapitalization.none,
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Description'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the description';
                }
                return null;
              },
              onSaved: (value) {
                _description = value!;
              },
              textCapitalization: TextCapitalization.none,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submitForm,
          child: const Text('Add'),
        ),
      ],
    );
  }
}

// Widget untuk menampilkan dialog edit buku
class EditBookDialog extends StatefulWidget {
  final BookDetail initialBook;
  final Function(String, String, String, String) onBookUpdated;

  const EditBookDialog({
    Key? key,
    required this.initialBook,
    required this.onBookUpdated,
  }) : super(key: key);

  @override
  _EditBookDialogState createState() => _EditBookDialogState();
}

class _EditBookDialogState extends State<EditBookDialog> {
  late TextEditingController _authorController;
  late TextEditingController _publishedDateController;
  late TextEditingController _genreController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _authorController = TextEditingController(text: widget.initialBook.author);
    _publishedDateController =
        TextEditingController(text: widget.initialBook.publishedDate);
    _genreController = TextEditingController(text: widget.initialBook.genre);
    _descriptionController =
        TextEditingController(text: widget.initialBook.description);
  }

  @override
  void dispose() {
    _authorController.dispose();
    _publishedDateController.dispose();
    _genreController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    final String author = _authorController.text;
    final String publishedDate = _publishedDateController.text;
    final String genre = _genreController.text;
    final String description = _descriptionController.text;

    widget.onBookUpdated(author, genre, publishedDate, description);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Book'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _authorController,
              decoration: const InputDecoration(labelText: 'Author'),
              textCapitalization: TextCapitalization.none,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _publishedDateController,
              decoration: const InputDecoration(labelText: 'Published Date'),
              textCapitalization: TextCapitalization.none,
              readOnly: true,
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        colorScheme: ColorScheme.light().copyWith(
                          primary: Colors.blue, // Your desired color here
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (pickedDate != null) {
                  setState(() {
                    _publishedDateController.text =
                        pickedDate.toString().split(' ')[0];
                  });
                }
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _genreController,
              decoration: const InputDecoration(labelText: 'Genre'),
              textCapitalization: TextCapitalization.none,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              textCapitalization: TextCapitalization.none,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submitForm,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
