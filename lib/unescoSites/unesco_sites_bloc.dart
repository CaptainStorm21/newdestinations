import 'package:flutter_bloc/flutter_bloc.dart';
import 'unesco_sites_event.dart';
import 'unesco_sites_state.dart';
import 'unesco_sites_repository.dart';

class UNESCOsitesBloc extends Bloc<UNESCOsitesEvent, UNESCOsitesState> {
  final UNESCOsitesRepository repository;

  UNESCOsitesBloc({required this.repository}) : super(UNESCOsitesInitial());

  @override
  Stream<UNESCOsitesState> mapEventToState(UNESCOsitesEvent event) async* {
    if (event is FetchUNESCOSites) {
      yield UNESCOsitesLoading();
      try {
        final sites = await repository.fetchUNESCOSites();
        yield UNESCOsitesLoaded(sites: sites);
      } catch (_) {
        yield UNESCOsitesError();
      }
    }
  }
}
