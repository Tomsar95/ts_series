part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState extends Equatable {}

class HomePageInitial extends HomePageState {
  final bool isLoading;

  HomePageInitial({required this.isLoading});

  @override
  List<Object> get props => [];
}

class LoadedSeriesState extends HomePageState {

  final List<Series>? listOfPopularSeries;
  final List<Series>? listOfRecommendedSeries;

  LoadedSeriesState({this.listOfPopularSeries, this.listOfRecommendedSeries});

  @override
  List<Object> get props => [];
}

class EmptyState extends HomePageState {
  @override
  List<Object> get props => [];
}

class ErrorState extends HomePageState {

  final String message;

  ErrorState({required this.message});

  @override
  List<Object> get props => [];
}


