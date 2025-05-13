import 'package:bookgen/presentation/constant/app_color.dart';
import 'package:bookgen/presentation/widgets/book_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColorone,
      body: Center(
        child: BookCard(),
      ),
    );
  }
}
