part of 'doctor_list_cubit.dart';

@immutable
sealed class DoctorListState {}

final class DoctorListInitial extends DoctorListState {}
final class LoadingDoctorList extends DoctorListState{}
final class LoadedDoctorList extends DoctorListState{
List doctors;
LoadedDoctorList(this.doctors);

}
final class ErrorDoctorList extends DoctorListState{
String error;
ErrorDoctorList(this.error);
}