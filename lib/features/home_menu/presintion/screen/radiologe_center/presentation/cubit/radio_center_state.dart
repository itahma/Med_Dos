part of 'radio_center_cubit.dart';

@immutable
sealed class RadioCenterState {}

final class RadioCenterInitial extends RadioCenterState {}
final class LoadingRadioCenter extends RadioCenterState{}
final class LoadedRadioCenter extends RadioCenterState{
List radioCenters;
LoadedRadioCenter(this.radioCenters);
}
final class ErrorRadioCenter extends RadioCenterState{
String error;
ErrorRadioCenter(this.error);
}