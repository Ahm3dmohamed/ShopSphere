// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:bookly/core/utils/features/home/data/models/book_model/book_model.dart';
// import 'package:hive/hive.dart';

// class CacheHelper {
//   static Future<void> saveBooks(BookModel bookModel) async {
//     // final Directory tempDir = await getTemporaryDirectory();

//     final Directory appDocumentsDir = await getApplicationDocumentsDirectory();

// // final Directory? downloadsDir = await getDownloadsDirectory();
//     final collection = await BoxCollection.open(
//       'getBook',
//       {"bookModel"},
//       path: appDocumentsDir.path,
//     );

//     // Open your boxes. Optional: Give it a type.
//     final bookBox = await collection.openBox<Map>('bookModel');

//     await bookBox.put('getBook', bookModel.toJson());
//   }

//   static Future<BookModel> getBooksData() async {
//     final Directory appDocumentsDir = await getApplicationDocumentsDirectory();

//     final collection = await BoxCollection.open(
//       'getBook',
//       {"bookModel"},
//       path: appDocumentsDir.path,
//     );

//     // Open your boxes. Optional: Give it a type.
//     final bookBox = await collection.openBox<Map>('bookModel');

//     final booksData = await bookBox.get('getBook');
//     BookModel bookModel = BookModel.fromJson(booksData!);
//     return bookModel;
//   }
// }
