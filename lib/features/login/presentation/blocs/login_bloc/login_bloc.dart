import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tv_series/features/core/usecases/usecase.dart';
import 'package:tv_series/features/core/utils/utils.dart';
import 'package:tv_series/features/login/domain/entities/user.dart';
import 'package:tv_series/features/login/domain/usecases/get_user.dart';
import 'package:tv_series/features/login/domain/usecases/set_user.dart';
import 'package:tv_series/features/login/domain/usecases/try_to_authenticate.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final GetUser getUser;
  final SetUser setUser;
  final TryToAuthenticate tryToAuthenticate;

  LoginBloc({required this.getUser, required this.setUser, required this.tryToAuthenticate}) : super(const LoginInitial(refresh: true)) {
    on<LoginEvent>((event, emit) async {
      if (event is OnStartLoginEvent) {
        emit(LoginLoadingState());
        if (event.mustReset == true){
          await setUser(const Params(user: User(name: '', password: '')));
          emit(const LoginInitial(refresh: false, closeSession: true));
        } else {
          User? tempUser;
          final failureOrUser = await getUser(NoParams());
          failureOrUser.fold((failure){
            emit(const LoginInitial(refresh: false));
          }, (value) {
            tempUser = value;
          });

          if(tempUser != null){
            final failureOrUser = await tryToAuthenticate(Params(user: tempUser!));
            failureOrUser.fold((failure) {
              emit(const LoginInitial(refresh: false));
            }, (value) {
              emit(LoginSuccessState());
            });
          }
        }

      }
      if(event is OnStartFormEvent) emit(const LoginDataEntryState(showError: false));
      if(event is OnResetEvent) emit(const LoginInitial(refresh: false));
      if(event is OnLoginEvent) {
        emit(LoginLoadingState());
        await Future.delayed(const Duration(seconds: 1));
        final failureOrUser = await tryToAuthenticate(Params(user: event.user));
        await setUser(Params(user: event.user));
        failureOrUser.fold((failure) {
          emit(const LoginDataEntryState(showError : true));
        }, (value) {
          emit(LoginSuccessState());
        });
      }
      if (event is OnLogoutEvent){
        emit(LoginLoadingState());
        await Future.delayed(const Duration(seconds: 1));
        await setUser(Params(user: event.user));
        emit(const LoginInitial(refresh: false));
      }
    });
  }
}
