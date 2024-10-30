import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:med_dos/features/myConsultations/data/repository/consulations_repository.dart';
import 'package:meta/meta.dart';

part 'consulation_state.dart';

class ConsulationCubit extends Cubit<ConsulationState> {

  ConsulationCubit(this.consulationRepository) : super(ConsulationInitial());
  ConsulationRepository consulationRepository;
  void createConsulation(String id,String message,String ?image,String ?pdf) async {
    final result = await consulationRepository.createConsulation(id, message, image, pdf);
    result.fold((l) => emit(ErrorSendConsulation(l.toString())), (r) {
      emit(succesSendConsulation(r));
    });
  }
  void getMyConsulation() async {
    emit(LoadingConsulation());
    final result = await consulationRepository.getMyConsulation();
    result.fold((l) => emit(ErrorConsulation(l.toString())), (r) {
      emit(LoadedConsulation(r));
    });
  }

}
