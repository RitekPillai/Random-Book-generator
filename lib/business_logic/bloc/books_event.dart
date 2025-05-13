part of 'books_bloc.dart';

@immutable
sealed class BooksEvent {}

final class BookdetailsFetch extends BooksEvent {}

final class BookCoveFetch extends BooksEvent {
  int bookId;
  BookCoveFetch(this.bookId, BookModel bookModel);
}
