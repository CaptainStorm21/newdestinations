import 'package:flutter_bloc/flutter_bloc.dart';

enum FilterModalState { opened, closed }

class FilterModalCubit extends Cubit<FilterModalState> {
  FilterModalCubit() : super(FilterModalState.closed);

  void openModal() => emit(FilterModalState.opened);
  void closeModal() => emit(FilterModalState.closed);
}