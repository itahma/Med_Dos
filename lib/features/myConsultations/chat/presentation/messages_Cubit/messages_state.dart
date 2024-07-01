part of 'messages_cubit.dart';

@immutable
sealed class MessagesState {}

final class MessagesInitial extends MessagesState {}
final class LoadingMessages  extends MessagesState{}
final class LoadedMessages  extends MessagesState{
List messages;
LoadedMessages(this.messages);
}
final class ErrorMessages extends MessagesState{
String error;
ErrorMessages(this.error);
}