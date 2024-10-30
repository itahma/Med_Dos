part of 'booking_cubit.dart';

@immutable
sealed class BookingState {}

final class BookingInitial extends BookingState {}
final class LoadingBooking extends BookingState{}
final class LoadedBooking extends BookingState{
List bookingState;
LoadedBooking(this.bookingState);
}
final class ErrorBooking extends BookingState{
String error;
ErrorBooking(this.error);
}
final class SuccessCancelBooking extends BookingState{
String message;
SuccessCancelBooking(this.message);
}
final class ErrorCancelBooking extends BookingState{
String error;
ErrorCancelBooking(this.error);
}