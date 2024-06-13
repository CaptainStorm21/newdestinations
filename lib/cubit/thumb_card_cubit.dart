import 'package:bloc/bloc.dart';
import 'thumb_card_state.dart';

class ThumbCardCubit extends Cubit<ThumbCardState> {
  ThumbCardCubit() : super(ThumbCardInitial());

  void delete() {
    // Implement delete functionality
    emit(ThumbCardDeleted());
    print('Card deleted');
  }

  void edit() {
    // Implement edit functionality
    emit(ThumbCardEdited());
    print('Edit screen loaded');
  }

  void share() {
    // Implement share functionality
    emit(ThumbCardShared());
    print('Shared to social media');
  }
}
