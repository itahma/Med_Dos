import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'laboratories_state.dart';

class LaboratoriesCubit extends Cubit<LaboratoriesState> {
  LaboratoriesCubit() : super(LaboratoriesInitial());
}
