import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/model/doctor_model.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/repostory/Doctor_repository.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit(this.doctorRepository) : super(DoctorInitial());

  DoctorRepository doctorRepository;
  bool? valReminder = false;

  onChangeVal(g) {
    valReminder = g;
  }
  bool isLike=false;
  Like() {
    isLike = !isLike!;
    emit(LikeDoctorState());

  }

  void getDoctorList(id) async {
    emit(LoadingDoctorList());
    final result = await doctorRepository.getDoctorInSpecialist(id);
    result.fold((l) => emit(ErrorDoctorList(l.toString())), (r) {
      emit(LoadedDoctorList(r));
    });
  }
  void bookAppointment(int doctorID,String date) async {
    final result = await doctorRepository.bookAppointment(doctorID,date);
    result.fold((l) => emit(ErrorBookAppointment(l)), (r) {
      emit(SuccessBookAppointment(r));
    });
  }
}
