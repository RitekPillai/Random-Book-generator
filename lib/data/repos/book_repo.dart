import 'dart:convert';

import 'package:bookgen/data/data_provider/book_data_provider.dart';
import 'package:bookgen/data/models/book_cover_model.dart';
import 'package:bookgen/data/models/book_model.dart';
import 'package:flutter/foundation.dart';

class BookRepo {
  final BookDataProvider bookDataprovider;

  BookRepo({
    required this.bookDataprovider,
  });

  Future<BookModel> getBook(int index, int page) async {
    try {
      final bookData = await bookDataprovider.getBookdata();
      final Map<String, dynamic> data = jsonDecode(bookData);

      final Map<String, dynamic> finaldata =
          data['reading_log_entries'][index]['work'];
      print(finaldata);
      return BookModel.fromjson(finaldata);
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }
}
