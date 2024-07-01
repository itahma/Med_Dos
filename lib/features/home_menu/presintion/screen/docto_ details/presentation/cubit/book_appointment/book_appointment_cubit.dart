import 'package:bloc/bloc.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/repostory/Doctor_repository.dart';
import 'package:meta/meta.dart';

part 'book_appointment_state.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {


  BookAppointmentCubit(this.doctorRepository) : super(BookAppointmentInitial());
  DoctorRepository doctorRepository;
  void getSlots(id,date) async {
    final result = await doctorRepository.getTimeDay(id,date);
    result.fold((l) => emit(ErrorSlots(l)), (r) {
      emit(LoadedSlote(r));
    });
  }
  void bookAppointment(String doctorID,String date,String time) async {
    final result = await doctorRepository.bookAppointment(doctorID,date,time);
    result.fold((l) => emit(ErrorBookAppointment(l)), (r) {
      emit(SuccessBookAppointment(r));
    });
  }
}
