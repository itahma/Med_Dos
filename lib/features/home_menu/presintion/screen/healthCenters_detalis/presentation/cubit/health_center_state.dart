part of 'health_center_cubit.dart';

@immutable
sealed class HealthCenterState {}

final class HealthCenterInitial extends HealthCenterState {}

final class LoadingHealthCenter extends HealthCenterState {}

final class LoadedHealthCenter extends HealthCenterState {
  List healthcenter;
  LoadedHealthCenter(this.healthcenter);
}

final class ErrorHealthCenter extends HealthCenterState {
  String error;
  ErrorHealthCenter(this.error);
}
