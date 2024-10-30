part of 'consulation_cubit.dart';

@immutable
sealed class ConsulationState {}

final class ConsulationInitial extends ConsulationState {}
final class succesSendConsulation extends ConsulationState{
  String message;
  succesSendConsulation(this.message);
}
final class ErrorSendConsulation extends ConsulationState{
String error;
ErrorSendConsulation(this.error);
}
final class LoadingConsulation  extends ConsulationState{}
final class LoadedConsulation  extends ConsulationState{
List consulation;
LoadedConsulation(this.consulation);
}
final class ErrorConsulation extends ConsulationState{
String error;
ErrorConsulation(this.error);
}