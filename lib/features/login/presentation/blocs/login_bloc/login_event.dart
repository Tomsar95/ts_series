part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class OnLoginEvent extends LoginEvent{
  final User user;
  final BuildContext context;
  const OnLoginEvent({required this.user, required this.context}) : super();
  @override
  List<Object?> get props => [];
}

class OnLogoutEvent extends LoginEvent{
  final User user;
  final BuildContext context;
  const OnLogoutEvent({required this.user, required this.context}) : super();
  @override
  List<Object?> get props => [];
}

class OnStartFormEvent extends LoginEvent{
  const OnStartFormEvent() : super();
  @override
  List<Object?> get props => [];
}

class OnResetEvent extends LoginEvent{
  const OnResetEvent() : super();
  @override
  List<Object?> get props => [];
}

class OnStartLoginEvent extends LoginEvent{

  final bool? mustReset;

  const OnStartLoginEvent({this.mustReset}) : super();
  @override
  List<Object?> get props => [];
}