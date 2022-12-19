

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tv_series/features/core/error/failures.dart';
import 'package:tv_series/features/core/usecases/usecase.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';
import 'package:tv_series/features/series/domain/use_cases/get_popular_series.dart';
import 'package:tv_series/features/series/domain/use_cases/get_recommended_series.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

const String serverFailureMessage = 'Server Failure.';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetPopularSeries getPopularSeries;
  final GetRecommendedSeries getRecommendedSeries;

  HomePageBloc({required this.getPopularSeries, required this.getRecommendedSeries}) : super(HomePageInitial(isLoading: true)) {
    on<HomePageEvent>((event, emit) async {
      if( event is GetSeriesEvent) {

        late bool popularSuccess;
        late bool recommendedSuccess;
        late String errorMsg = '';
        List<Series>? popularSeries;
        List<Series>? recommendedSeries;

        emit(HomePageInitial(isLoading: true));
        final popularSeriesOrFailure = await getPopularSeries(NoParams());
        await popularSeriesOrFailure.fold((failure) {
          popularSuccess = false;
          errorMsg =_mapFailureToMessage(failure);
        }, (series) async {
          popularSuccess = true;
          popularSeries = series;
        });

        final recommendedSeriesOrFailure = await getRecommendedSeries(NoParams());
        await recommendedSeriesOrFailure.fold((failure) {
          recommendedSuccess = false;
          errorMsg =_mapFailureToMessage(failure);
        }, (series) async {
          recommendedSuccess = true;
          recommendedSeries = series;
        });

        if(popularSuccess == false && recommendedSuccess == false){
          emit(ErrorState(message: errorMsg));
        } else {
          emit(LoadedSeriesState(listOfPopularSeries: popularSeries, listOfRecommendedSeries: recommendedSeries));
        }
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
