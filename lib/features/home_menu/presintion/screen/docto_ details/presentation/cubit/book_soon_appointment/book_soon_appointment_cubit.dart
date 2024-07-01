import 'package:bloc/bloc.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/model/doctor_model.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/model/soon_slot.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/repostory/Doctor_repository.dart';
import 'package:meta/meta.dart';

part 'book_soon_appointment_state.dart';

class BookSoonAppointmentCubit extends Cubit<BookSoonAppointmentState> {
  BookSoonAppointmentCubit(this.doctorRepository) : super(BookSoonAppointmentInitial());
  DoctorRepository doctorRepository;
  void bookSoonAppointment(String doctorID,date,start) async {
    final result = await doctorRepository.bookSoonAppointment(doctorID,date,start);
    result.fold((l) => emit(ErrorBookSoonAppointment(l)), (r) {
      emit(SuccessBookSoonAppointment(r));
    });
  }
  void getSoonAppointment(String doctorID) async {
    final result = await doctorRepository.getSoonAppointment(doctorID);
    result.fold((l) => emit(ErrorBookSoonAppointment(l)), (r) {
      emit(SuccessGetSoonAppointment(r));
    });
  }
}
