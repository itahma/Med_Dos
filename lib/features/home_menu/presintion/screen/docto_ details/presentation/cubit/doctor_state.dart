part of 'doctor_cubit.dart';

 class DoctorState  {
  const DoctorState();
}

final class DoctorInitial extends DoctorState {
  @override
  List<Object> get props => [];
}
final class Changeval extends DoctorState {
@override
List<Object> get props => [];
}
final class LoadingDoctorList extends DoctorState{}
final class LoadedDoctorList extends DoctorState{
   List<DoctorModel> doctors;
   LoadedDoctorList(this.doctors);

}
final class ErrorDoctorList extends DoctorState{
   String error;
   ErrorDoctorList(this.error);
}
final class ErrorBookAppointment extends DoctorState{
String error;
ErrorBookAppointment(this.error);
}
final class SuccessBookAppointment extends DoctorState{
String message;
SuccessBookAppointment(this.message);
}
final class LikeDoctorState extends DoctorState{}