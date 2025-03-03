part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeOnAddMarker extends HomeState {}
final class HomeLocationUpdated extends HomeState {}
final class HomePolylineUpdated extends HomeState {}
final class HomeDistanceUpdated extends HomeState {}
