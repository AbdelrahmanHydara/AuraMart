import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/features/search/cubit/search_cubit.dart';
import 'search_empty_result.dart';
import 'search_failure_result.dart';
import 'search_initial_suggestions.dart';
import 'search_loading_view.dart';
import 'search_success_result.dart';

class SearchViewProductsBlocBuilder extends StatelessWidget {
  const SearchViewProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return const SearchLoadingView();
          }
          if (state is SearchSuccess) {
            return SearchSuccessResult(results: state.searchResults);
          }
          if (state is SearchEmpty) {
            return const SearchEmptyResult();
          }
          if (state is SearchFailure) {
            return SearchFailureResult(errorMessage: state.errorMessage,);
          }
          return const SearchInitialSuggestions();
        },
      ),
    );
  }
}
