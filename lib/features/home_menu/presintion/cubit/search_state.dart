part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class LoadingSearchState extends SearchState{}
final class LoadedSearchState extends SearchState{
List doctors;
LoadedSearchState(this.doctors);
}
final class ErrorSearchState extends SearchState{
String error;
ErrorSearchState(this.error);
}