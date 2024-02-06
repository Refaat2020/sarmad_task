part of 'landing_cubit.dart';

@immutable
abstract class LandingState {}

class LandingInitial extends LandingState {}

class LandingLoading extends LandingState {}

class LandingPaginatedLoading extends LandingState {}

class LandingPaginatedDone extends LandingState {}

class LandingEmpty extends LandingState {}

class LandingDone extends LandingState {}

class LandingError extends LandingState {
  final String? errorMessage;

  LandingError({this.errorMessage});
}
