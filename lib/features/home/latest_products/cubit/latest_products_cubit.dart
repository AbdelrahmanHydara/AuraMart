import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'latest_products_state.dart';

class LatestProductsCubit extends Cubit<LatestProductsState> {
  LatestProductsCubit() : super(LatestProductsInitial());
}
