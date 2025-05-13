import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bookgen/data/models/book_cover_model.dart';
import 'package:bookgen/data/models/book_model.dart';
import 'package:bookgen/data/repos/book_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final BookRepo _bookRepo;
  BooksBloc(this._bookRepo) : super(BooksInitial()) {
    BookModel? book;
    BookCoverModel? cover;
    on<BookdetailsFetch>((event, emit) async {
      int index = Random().nextInt(50);
      print(index);
      int page = Random().nextInt(9);
      try {
        emit(BookLoading());
        //book deatils fecting......
        book = await _bookRepo.getBook(index, page);
        debugPrint("Book details Feteched");

        emit(Bookfetched(bookModel: book!));
        //books cover fecting.....
        debugPrint("in the BookFecthed state");

        debugPrint("Book Cover Feteched");
        emit(Allfetched(
          bookModel: book!,
        ));
      } catch (e, s) {
        emit(BookFailed(e.toString()));
        debugPrint(s.toString());
      }
    });

    //   on<BookCoveFetch>((event, emit) async {
    //     try {
    //       if (state is BookdetailsFetch) {
    //         cover = await _bookRepo.getCover(event.bookId);
    //         debugPrint("---------Covering on process-----------");
    //         emit(Allfetched(bookModel: book!, bookCoverModel: cover!));
    //         debugPrint("Covering complet");
    //       }
    //     } catch (e, s) {
    //       emit(BookFailed(e.toString()));
    //       debugPrint(s.toString());
    //     }
    //   });
    // }
    @override
    void onTransition(Transition<BooksEvent, BooksState> transition) {
      // TODO: implement onTransition
      debugPrint(transition.toString());
      super.onTransition(transition);
    }
  }
}
