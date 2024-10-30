import 'package:bloc/bloc.dart';
import 'package:med_dos/features/home_menu/presintion/screen/healthCenters_detalis/data/repository/HealthCenterRepository.dart';
import 'package:meta/meta.dart';

part 'doctor_center_state.dart';

class DoctorCenterCubit extends Cubit<DoctorCenterState> {
  DoctorCenterCubit(this.healthCenterRepository) : super(DoctorCenterInitial());
  HealthCenterRepository healthCenterRepository;
  void getDoctorList(sec,id) async {
    emit(LoadingDoctorCenter());
    final result = await healthCenterRepository.getDoctorInCenter(sec,id);
    result.fold((l) => emit(ErrorDoctorCenter(l.toString())), (r) {
      emit(LoadedDoctorCenter(r));
    });
  }
}
