part of 'enable_location_cubit.dart';

@immutable
abstract class EnableLocationState {}

class EnableLocationInitial extends EnableLocationState {}

class EnableLocationLoaded extends EnableLocationState {
  final double latitude;
  final double longitude;
  EnableLocationLoaded(this.latitude, this.longitude);
}

class EnableLocationError extends EnableLocationState {
  final String message;
  EnableLocationError(this.message);
}
