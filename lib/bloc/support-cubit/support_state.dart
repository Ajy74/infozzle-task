part of 'support_cubit.dart';

@immutable
sealed class SupportState {}

final class SupportInitial extends SupportState {}

final class SupportProcessingState extends SupportState {}

final class SupportSuccessState extends SupportState {
  final String message;
  
  SupportSuccessState({required this.message});
}

final class SupportErrorState extends SupportState {
  final String message;

  SupportErrorState({required this.message});
}