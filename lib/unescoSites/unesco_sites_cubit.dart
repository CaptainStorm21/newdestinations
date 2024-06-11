import 'package:bloc/bloc.dart';
import 'unesco_sites_state.dart';
import 'unesco_sites_repository.dart';

class UNESCOsitesCubit extends Cubit<UNESCOsitesState> {
  final UNESCOsitesRepository repository;

  UNESCOsitesCubit({required this.repository}) : super(UNESCOsitesInitial());

  void fetchUNESCOSites() async {
    emit(UNESCOsitesLoading());
    try {
      final sites = await repository.fetchUNESCOSites();
      emit(UNESCOsitesLoaded(sites: sites));
    } catch (_) {
      emit(UNESCOsitesError());
    }
  }
}
