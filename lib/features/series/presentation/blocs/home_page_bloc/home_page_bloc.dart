import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tv_series/features/core/error/failures.dart';
import 'package:tv_series/features/core/usecases/usecase.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';
import 'package:tv_series/features/series/domain/use_cases/get_series.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

const String serverFailureMessage = 'Server Failure.';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetSeries getSeries;

  HomePageBloc({required this.getSeries}) : super(HomePageInitial(isLoading: true)) {
    on<HomePageEvent>((event, emit) async {
      if( event is GetSeriesEvent) {
        emit(HomePageInitial(isLoading: true));
        final popularSeriesOrFailure = await getSeries(NoParams());
        await popularSeriesOrFailure.fold((failure) {
          emit(ErrorState(message: _mapFailureToMessage(failure)));
        }, (series) async {
          emit(LoadedSeriesState(listOfPopularSeries: series));
        });
      }
    });
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return serverFailureMessage;
    default:
      return 'Unexpected error';
  }
}
