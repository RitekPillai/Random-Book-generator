import 'package:bookgen/business_logic/bloc/books_bloc.dart';
import 'package:bookgen/data/data_provider/book_data_provider.dart';
import 'package:bookgen/data/repos/book_repo.dart';
import 'package:bookgen/presentation/Screens/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => BookRepo(
        bookDataprovider: BookDataProvider(),
      ),
      child: BlocProvider(
        create: (context) => BooksBloc(
          context.read<BookRepo>(),
        ),
        child: MaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
