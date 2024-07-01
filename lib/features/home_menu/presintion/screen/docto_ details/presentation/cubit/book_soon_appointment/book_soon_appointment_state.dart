part of 'book_soon_appointment_cubit.dart';

@immutable
sealed class BookSoonAppointmentState {}

final class BookSoonAppointmentInitial extends BookSoonAppointmentState {}
final class ErrorBookSoonAppointment extends BookSoonAppointmentState{
String error;
ErrorBookSoonAppointment(this.error);
}
final class SuccessBookSoonAppointment extends BookSoonAppointmentState{
String message;
SuccessBookSoonAppointment(this.message);
}
final class ErrorGetSoonAppointment extends BookSoonAppointmentState{
String error;
ErrorGetSoonAppointment(this.error);
}
final class SuccessGetSoonAppointment extends BookSoonAppointmentState{
SoonSlot soonSlot;
SuccessGetSoonAppointment(this.soonSlot);
}