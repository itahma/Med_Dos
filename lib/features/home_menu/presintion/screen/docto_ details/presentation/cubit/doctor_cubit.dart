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
    isLike = !isLike;


  }


  void getDoctorInfo(id) async {
    emit(LoadingDoctorInfo());
    final result = await doctorRepository.getDoctorInfo(id);
    result.fold((l) => emit(ErrorDoctorInfo(l.toString())), (r) {
      emit(LoadedDoctorInfo(r));
    });
  }

}
