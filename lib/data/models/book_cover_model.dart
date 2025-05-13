class BookCoverModel {
  final String coverLink;
  final int height;
  final int width;
  BookCoverModel(
      {required this.coverLink, required this.height, required this.width});

  factory BookCoverModel.fromjson(Map<String, dynamic> json) {
    return BookCoverModel(
        coverLink: json['source_url'],
        height: json['height'],
        width: json['width']);
  }
}
