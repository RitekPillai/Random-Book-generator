import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class BookDataProvider {
  Future<String> getBookdata() async {
    Random random = Random();
    int randomIndex = random.nextInt(2);

    final List<String> listUrl = [
      "https://openlibrary.org/people/mekBot/books/want-to-read.json",
      "https://openlibrary.org/people/mekBot/books/already-read.json"
    ];
    final String url = listUrl[randomIndex];

    try {
      final Response res = await http.get(Uri.parse(
          "https://openlibrary.org/people/mekBot/books/want-to-read.json"));

      return res.body;
    } catch (e) {
      debugPrint("Error fetching books: $e");
      throw Exception('Failed to load books');
    }
  }
}
