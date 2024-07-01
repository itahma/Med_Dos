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

final class LoadingDoctorInfo extends DoctorState{}
final class LoadedDoctorInfo extends DoctorState{
DoctorModel doctorModel;
LoadedDoctorInfo(this.doctorModel);

}
final class ErrorDoctorInfo extends DoctorState{
String error;
ErrorDoctorInfo(this.error);
}

final class LikeDoctorState extends DoctorState{}