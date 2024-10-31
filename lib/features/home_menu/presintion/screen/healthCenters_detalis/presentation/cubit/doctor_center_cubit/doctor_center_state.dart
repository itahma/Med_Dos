part of 'doctor_center_cubit.dart';

@immutable
sealed class DoctorCenterState {}

final class DoctorCenterInitial extends DoctorCenterState {}

final class LoadingDoctorCenter extends DoctorCenterState {}

final class LoadedDoctorCenter extends DoctorCenterState {
List doctorshealthcenter;
LoadedDoctorCenter(this.doctorshealthcenter);
}

final class ErrorDoctorCenter extends DoctorCenterState {
String error;
ErrorDoctorCenter(this.error);
}
