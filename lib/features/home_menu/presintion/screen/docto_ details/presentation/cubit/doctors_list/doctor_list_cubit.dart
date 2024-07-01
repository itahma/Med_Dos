import 'package:bloc/bloc.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/repostory/Doctor_repository.dart';
import 'package:meta/meta.dart';

part 'doctor_list_state.dart';

class DoctorListCubit extends Cubit<DoctorListState> {
  DoctorListCubit(this.doctorRepository) : super(DoctorListInitial());

  DoctorRepository doctorRepository;
  void getDoctorList(id) async {
    emit(LoadingDoctorList());
    final result = await doctorRepository.getDoctorInSpecialist(id);
    result.fold((l) => emit(ErrorDoctorList(l.toString())), (r) {
      emit(LoadedDoctorList(r));
    });
  }
}
