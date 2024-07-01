import 'package:bloc/bloc.dart';
import 'package:med_dos/features/myConsultations/chat/data/repository/messages_repository.dart';
import 'package:meta/meta.dart';

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit(this.messagesRepository) : super(MessagesInitial());
  MessagesRepository messagesRepository;

  void getMessages(id) async {
    emit(LoadingMessages());
    final result = await messagesRepository.getMessages(id);
    result.fold((l) => emit(ErrorMessages(l.toString())), (r) {
      emit(LoadedMessages(r));
    });
  }
}
