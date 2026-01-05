import 'package:flutter/material.dart';
import 'widgets/search_body_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SearchBodyScreen(),
      ),
    );
  }
}