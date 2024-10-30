import 'package:bloc/bloc.dart';
import 'package:med_dos/features/home_menu/presintion/screen/radiologe_center/data/radio_center_repository/radio_center_repository.dart';
import 'package:meta/meta.dart';

part 'radio_center_state.dart';

class RadioCenterCubit extends Cubit<RadioCenterState> {
  RadioCenterCubit(this.radioCenterRepository) : super(RadioCenterInitial());
  RadioCenterRepository radioCenterRepository;
  void getAllRadioCenter() async {
    emit(LoadingRadioCenter());
    final result = await radioCenterRepository.getAllRadioCenter();
    result.fold((l) => emit(ErrorRadioCenter(l.toString())), (r) {
      emit(LoadedRadioCenter(r));
    });
  }
}
