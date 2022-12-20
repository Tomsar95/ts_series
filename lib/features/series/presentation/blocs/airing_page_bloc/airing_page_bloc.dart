
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/features/core/usecases/usecase.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';
import 'package:tv_series/features/series/domain/use_cases/get_airing_series.dart';

part 'airing_page_event.dart';

part 'airing_page_state.dart';

class AiringPageBloc extends Bloc<AiringPageEvent, AiringPageState> {
  final GetAiringSeries getAiringSeries;

  AiringPageBloc({required this.getAiringSeries})
      : super(const AiringPageInitial(isLoading: true)) {
    on<AiringPageEvent>((event, emit) async {
      if (event is GetSeriesEvent) {
        
        emit(const AiringPageInitial(isLoading: true));
        final airingSeriesOrFailure = await getAiringSeries(NoParams());
        await airingSeriesOrFailure.fold((failure) {
          emit(const ErrorState(
              message: 'Ops,an error occurred loading your data'));
        }, (series) async {
          emit(LoadedSeriesState(listOfAiringSeries: series));
        });
      }
    });
  }
}
