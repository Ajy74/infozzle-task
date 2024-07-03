part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterProcessingState extends RegisterState {}

final class RegisteSuccessState extends RegisterState {
  final String message;
  final String userid;

  RegisteSuccessState({required this.message, required this.userid});
}

final class RegisteErrorState extends RegisterState {
  final String message;

  RegisteErrorState({required this.message});
}
