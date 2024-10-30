import 'package:bloc/bloc.dart';
import 'package:med_dos/features/home_menu/presintion/screen/healthCenters_detalis/data/Model/HealthCenterModel.dart';
import 'package:med_dos/features/home_menu/presintion/screen/healthCenters_detalis/data/repository/HealthCenterRepository.dart';
import 'package:meta/meta.dart';

part 'health_center_state.dart';

class HealthCenterCubit extends Cubit<HealthCenterState> {
  HealthCenterCubit(this.healthCenterRepository) : super(HealthCenterInitial());
  final HealthCenterRepository healthCenterRepository;

  void getAllHealthCenter() async {
    emit(LoadingHealthCenter());
    final result = await healthCenterRepository.getAllHealthCenter();
    result.fold((l) => emit(ErrorHealthCenter(l.toString())), (r) {
      emit(LoadedHealthCenter(r));
    });
  }



}
