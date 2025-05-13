part of 'books_bloc.dart';

@immutable
sealed class BooksState {}

final class BooksInitial extends BooksState {}

final class BookLoading
    extends BooksState {} //state=if the book is currently being fecteched

final class Bookfetched extends BooksState {
  final BookModel bookModel;
  Bookfetched({required this.bookModel});
} //state= if the bookd data fetched sucessfully

final class BookFailed extends BooksState {
  final String message;
  BookFailed(this.message);
} //state = if the book data is failed to fetch

final class Allfetched extends BooksState {
  final BookModel bookModel;

  Allfetched({
    required this.bookModel,
  });
} //state = if the book data and cover data is fetched sucessfully

