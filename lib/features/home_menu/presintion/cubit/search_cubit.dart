import 'package:bloc/bloc.dart';
import 'package:med_dos/features/home_menu/data/search_repository/search_repository.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepository) : super(SearchInitial());
  SearchRepository searchRepository;
  void searchDoctor(query,sec) async {
    emit(LoadingSearchState());
    final result = await searchRepository.searchDoctor(query, sec);
    result.fold((l) => emit(ErrorSearchState(l.toString())), (r) {
      emit(LoadedSearchState(r));
    });
  }
}
