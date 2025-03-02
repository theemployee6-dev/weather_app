part of 'location_bloc.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationSuccess extends LocationState {
  final Position position;
  const LocationSuccess(this.position);

  @override
  List<Object> get props => [position];
}

final class LocationFailure extends LocationState {
  final String error;

  const LocationFailure(this.error);

  @override
  List<Object> get props => [error];
}
