import 'package:bloc/bloc.dart';

enum TabState { LocalHappenings, DayTours, MultiDayTravels, Regions }

class TabCubit extends Cubit<TabState> {
  TabCubit() : super(TabState.LocalHappenings);

  void updateTab(TabState tab) => emit(tab);
}
