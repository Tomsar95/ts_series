part of 'details_component_bloc.dart';

abstract class DetailsComponentState extends Equatable {
  const DetailsComponentState();
}

class DetailsComponentInitial extends DetailsComponentState {

  final bool isLoading;

  const DetailsComponentInitial({required this.isLoading});

  @override
  List<Object> get props => [];
}

class LoadedSeriesState extends DetailsComponentState {

  final Series series;

  const LoadedSeriesState({required this.series});

  @override
  List<Object> get props => [];
}

class ErrorState extends DetailsComponentState {

  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [];
}

