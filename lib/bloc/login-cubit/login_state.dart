part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginProcessingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final String message;
  
  LoginSuccessState({required this.message});
}

final class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState({required this.message});
}
