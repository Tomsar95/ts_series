part of 'airing_page_bloc.dart';

abstract class AiringPageState extends Equatable {
  const AiringPageState();
}

class AiringPageInitial extends AiringPageState {
  final bool isLoading;

  const AiringPageInitial({required this.isLoading});

  @override
  List<Object> get props => [];
}

class LoadedSeriesState extends AiringPageState {

  final List<Series> listOfAiringSeries;

  const LoadedSeriesState({required this.listOfAiringSeries});

  @override
  List<Object> get props => [];
}

class EmptyState extends AiringPageState {
  @override
  List<Object> get props => [];
}

class ErrorState extends AiringPageState {

  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [];
}
