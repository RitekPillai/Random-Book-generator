class BookModel {
  final String title;
  final String authorName;

  final int publishYear;
  final int coverId;

  BookModel(
      {required this.title,
      required this.authorName,
      required this.publishYear,
      required this.coverId});

  factory BookModel.fromjson(Map<String, dynamic> json) {
    return BookModel(
        title: json['title'],
        authorName: json['author_names'][0],
        publishYear: json['first_publish_year'],
        coverId: json['cover_id']);
  }
}
