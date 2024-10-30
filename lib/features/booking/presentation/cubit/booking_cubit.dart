import 'package:bloc/bloc.dart';
import 'package:med_dos/features/booking/data/repository/booking_repository.dart';
import 'package:meta/meta.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(this.bookingRepository) : super(BookingInitial());

  BookingRepository bookingRepository;
  List bookings=[];

  void getMyBooking() async {
    emit(LoadingBooking());
    final result = await bookingRepository.getMyBooking();
    result.fold((l) => emit(ErrorBooking(l.toString())), (r) {
      emit(LoadedBooking(r));
    });
  }
  void cancleBooking(id) async {

    final result = await bookingRepository.cancelBooking(id);
    result.fold((l) => emit(ErrorCancelBooking(l.toString())), (r) {
      emit(SuccessCancelBooking(r));
    });
  }
}
