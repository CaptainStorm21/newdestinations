import 'package:bloc/bloc.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState());

  void toggleBudget(String budget) {
    final updatedBudgets = Map<String, bool>.from(state.budgets);
    updatedBudgets[budget] = !(updatedBudgets[budget] ?? false);
    emit(state.copyWith(budgets: updatedBudgets));
  }

  void toggleCuisine(String cuisine) {
    final updatedCuisines = Map<String, bool>.from(state.cuisines);
    updatedCuisines[cuisine] = !(updatedCuisines[cuisine] ?? false);
    emit(state.copyWith(cuisines: updatedCuisines));
  }

  void toggleRating(String rating) {
    final updatedRatings = Map<String, bool>.from(state.ratings);
    updatedRatings[rating] = !(updatedRatings[rating] ?? false);
    emit(state.copyWith(ratings: updatedRatings));
  }

  void toggleTour(String tour) {
    final updatedTours = Map<String, bool>.from(state.tours);
    updatedTours[tour] = !(updatedTours[tour] ?? false);
    emit(state.copyWith(tours: updatedTours));
  }

  void toggleExperience(String experience) {
    final updatedExperiences = Map<String, bool>.from(state.experiences);
    updatedExperiences[experience] = !(updatedExperiences[experience] ?? false);
    emit(state.copyWith(experiences: updatedExperiences));
  }

  void setSorting(String sorting) {
    emit(state.copyWith(sorting: sorting));
  }
}

class FilterState {
  final Map<String, bool> budgets;
  final Map<String, bool> cuisines;
  final Map<String, bool> ratings;
  final Map<String, bool> tours;
  final Map<String, bool> experiences;
  final String sorting;

  FilterState({
    Map<String, bool>? budgets,
    Map<String, bool>? cuisines,
    Map<String, bool>? ratings,
    Map<String, bool>? tours,
    Map<String, bool>? experiences,
    this.sorting = '',
  })  : budgets = budgets ?? {'\$': false, '\$\$': false, '\$\$\$': false, '\$\$\$\$': false, '\$\$\$\$\$': false},
        cuisines = cuisines ?? {
          'Italian': false, 'Chinese': false, 'Japanese': false, 'Indian': false, 'Mexican': false,
          'American': false, 'French': false, 'Thai': false, 'Spanish': false, 'Greek': false,
          'Vietnamese': false, 'Turkish': false, 'Lebanese': false, 'Korean': false, 'Brazilian': false,
          'Ethiopian': false, 'German': false, 'British': false, 'Caribbean': false, 'Moroccan': false,
          'Russian': false, 'Argentinian': false, 'Peruvian': false, 'Malaysian': false, 'Filipino': false,
          'Indonesian': false, 'Cuban': false, 'Portuguese': false, 'Swiss': false, 'Middle Eastern': false,
          'Bakery': false, 'Cafe': false, 'Vegan': false, 'Vegetarian': false, 'Farm-To-Table / Locally Grown': false
        },
        ratings = ratings ?? {'★☆☆☆☆': false, '★★☆☆☆': false, '★★★☆☆': false, '★★★★☆': false, '★★★★★': false},
        tours = tours ?? {'from 1 to 10': false, 'from 11 to 20': false, 'from 21 - 30': false},
        experiences = experiences ?? {
          'Family & Kids Activities': false, 'Adventure Sports & Thrills': false, 'Shopping & Markets': false,
          'Educational & Workshops': false, 'Nature & Wildlife': false, 'Entertainment & Events': false,
          'Wellness & Relaxation': false, 'Cultural & Historical Experiences': false
        };

  FilterState copyWith({
    Map<String, bool>? budgets,
    Map<String, bool>? cuisines,
    Map<String, bool>? ratings,
    Map<String, bool>? tours,
    Map<String, bool>? experiences,
    String? sorting,
  }) {
    return FilterState(
      budgets: budgets ?? this.budgets,
      cuisines: cuisines ?? this.cuisines,
      ratings: ratings ?? this.ratings,
      tours: tours ?? this.tours,
      experiences: experiences ?? this.experiences,
      sorting: sorting ?? this.sorting,
    );
  }
}
