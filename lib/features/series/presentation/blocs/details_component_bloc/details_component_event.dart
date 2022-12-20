part of 'details_component_bloc.dart';

abstract class DetailsComponentEvent extends Equatable {
  const DetailsComponentEvent();
}

class GetSeriesEvent extends DetailsComponentEvent{

  final int id;

  const GetSeriesEvent({required this.id});

  @override
  List<Object?> get props => [];
}
