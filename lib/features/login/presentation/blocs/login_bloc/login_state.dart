part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {

  final bool refresh;
  final bool? closeSession;

  const LoginInitial({required this.refresh, this.closeSession});

  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginDataEntryState extends LoginState {

  final bool showError;

  const LoginDataEntryState({required this.showError});

  @override
  List<Object> get props => [];
}

class LoginSuccessState extends LoginState {
  @override
  List<Object> get props => [];
}
