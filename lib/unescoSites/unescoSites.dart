import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'unesco_sites_cubit.dart';
import 'unesco_sites_state.dart';
import 'unesco_sites_repository.dart';
import '../models/unesco_site.dart';

class UNESCOsites extends StatelessWidget {
  const UNESCOsites({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UNESCOsitesCubit(repository: UNESCOsitesRepository())..fetchUNESCOSites(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('UNESCO Sites'),
        ),
        body: BlocBuilder<UNESCOsitesCubit, UNESCOsitesState>(
          builder: (context, state) {
            if (state is UNESCOsitesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UNESCOsitesLoaded) {
              return ListView.builder(
                itemCount: state.sites.length,
                itemBuilder: (context, index) {
                  final site = state.sites[index];
                  return Card(
                    child: ListTile(
                      leading: site.photoUrl.isNotEmpty
                          ? SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.network(site.photoUrl, width: 50, height: 50, fit: BoxFit.cover))
                          : null,
                      title: Text(site.name),
                      subtitle: Text(
                        '${site.location.city}, ${site.location.state}, ${site.location.country}\n${site.description}',
                      ),
                    ),
                  );
                },
              );
            } else if (state is UNESCOsitesError) {
              return const Center(child: Text('Failed to load UNESCO sites'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
