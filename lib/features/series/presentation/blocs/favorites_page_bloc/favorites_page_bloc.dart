import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/features/core/utils/utils.dart';

import '../../../domain/entities/series.dart';

part 'favorites_page_event.dart';
part 'favorites_page_state.dart';

class FavoritesPageBloc extends Bloc<FavoritesPageEvent, FavoritesPageState> {
  FavoritesPageBloc() : super(const FavoritesPageInitial(isLoading: true)) {
    on<FavoritesPageEvent>((event, emit) async {
      if( event is GetSeriesEvent) {
        emit(const FavoritesPageInitial(isLoading: true));
        await Future.delayed(const Duration(milliseconds: 300));
        final List<Series> favoriteSeries = Utils.favoriteSeries;

        if(favoriteSeries.isEmpty || favoriteSeries == []) {
          emit(const ErrorState(message: 'You don´t have favorite series added yet'));
        } else {
          emit(LoadedSeriesState(listOfFavoriteSeries: favoriteSeries));
        }
      }
    });
  }
}
