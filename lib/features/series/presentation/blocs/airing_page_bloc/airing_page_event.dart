part of 'airing_page_bloc.dart';

abstract class AiringPageEvent extends Equatable {
  const AiringPageEvent();
}

class GetSeriesEvent extends AiringPageEvent{
  @override
  List<Object?> get props => [];
}
