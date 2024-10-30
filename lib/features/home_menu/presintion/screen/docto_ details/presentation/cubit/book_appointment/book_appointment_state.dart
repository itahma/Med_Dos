part of 'book_appointment_cubit.dart';

@immutable
sealed class BookAppointmentState {}

final class BookAppointmentInitial extends BookAppointmentState {}
final class ErrorBookAppointment extends BookAppointmentState{
String error;
ErrorBookAppointment(this.error);
}
final class SuccessBookAppointment extends BookAppointmentState{
String message;
SuccessBookAppointment(this.message);
}
final class LoadedSlote extends BookAppointmentState{
List slots;
LoadedSlote(this.slots);

}
final class ErrorSlots extends BookAppointmentState{
String message;
ErrorSlots(this.message);
}