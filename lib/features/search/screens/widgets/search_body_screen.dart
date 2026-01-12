import 'package:flutter/material.dart';
import 'package:shopx/core/helpers/spacing.dart';
import 'package:shopx/features/search/screens/widgets/search_field.dart';
import 'search_view_products_bloc_builder.dart';

class SearchBodyScreen extends StatelessWidget {
  const SearchBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(20),
        const SearchField(),
        const SearchViewProductsBlocBuilder(),
      ],
    );
  }
}
