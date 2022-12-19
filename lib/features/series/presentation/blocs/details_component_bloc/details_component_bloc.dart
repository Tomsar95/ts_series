
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';
import 'package:tv_series/features/series/domain/use_cases/get_series_details.dart';

part 'details_component_event.dart';
part 'details_component_state.dart';

class DetailsComponentBloc extends Bloc<DetailsComponentEvent, DetailsComponentState> {

  final GetSeriesDetails getDetails;

  DetailsComponentBloc({required this.getDetails}) : super(const DetailsComponentInitial(isLoading: true)) {
    on<DetailsComponentEvent>((event, emit) async {
      if (event is GetSeriesEvent) {
        emit(const DetailsComponentInitial(isLoading: true));
        final airingSeriesOrFailure = await getDetails(Params(seriesId: event.id));
        await airingSeriesOrFailure.fold((failure) {
          emit(const ErrorState(
              message: 'Ops,an error occurred loading your data'));
        }, (series) async {
          emit(LoadedSeriesState(series: series));
        });
      }
    });
  }
}
