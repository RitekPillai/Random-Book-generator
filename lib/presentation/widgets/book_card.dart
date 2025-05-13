import 'package:bookgen/business_logic/bloc/books_bloc.dart';
import 'package:bookgen/presentation/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<BooksBloc, BooksState>(
        builder: (context, state) {
          if (state is BookLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is BookFailed) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Oops Something went Wrong TvT'),
                ElevatedButton(
                    style: const ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                        fixedSize: WidgetStatePropertyAll(Size(200, 50)),
                        backgroundColor: WidgetStatePropertyAll(Colors.white)),
                    onPressed: () {
                      context.read<BooksBloc>().add(BookdetailsFetch());
                    },
                    child: const Text(
                      "Try Aagin",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ))
              ],
            ));
          }
          if (state is Allfetched) {
            final data = state.bookModel;

            //  final String coverURL = coverData.coverLink;
            final String title = data.title;

            final String authorName = data.authorName;
            final int pubishYear = data.publishYear;
            final String coverURL =
                "https://covers.openlibrary.org/b/id/${data.coverId}-L.jpg";
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    fit: BoxFit.fill,
                    coverURL,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    title,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "by $authorName",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      "Publish Year:$pubishYear"),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                        fixedSize: WidgetStatePropertyAll(Size(200, 50)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                        backgroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        context.read<BooksBloc>().add(BookdetailsFetch());
                      },
                      child: const Text(
                        textAlign: TextAlign.center,
                        "Generate Another.....",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ))
                ],
              ),
            );
          }
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(backgroundColorone),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 2),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10))))),
                  onPressed: () {
                    context.read<BooksBloc>().add(BookdetailsFetch());
                  },
                  child: const Text(
                    "Click to generate The Random Book",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
          ]);
        },
      ),
    );
  }
}
