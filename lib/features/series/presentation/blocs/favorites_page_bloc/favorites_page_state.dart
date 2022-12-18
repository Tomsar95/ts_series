part of 'favorites_page_bloc.dart';

abstract class FavoritesPageState extends Equatable {
  const FavoritesPageState();
}

class FavoritesPageInitial extends FavoritesPageState {
  final bool isLoading;

  const FavoritesPageInitial({required this.isLoading});

  @override
  List<Object> get props => [];
}

class LoadedSeriesState extends FavoritesPageState {

  final List<Series> listOfFavoriteSeries;

  const LoadedSeriesState({required this.listOfFavoriteSeries});

  @override
  List<Object> get props => [];
}

class EmptyState extends FavoritesPageState {
  @override
  List<Object> get props => [];
}

class ErrorState extends FavoritesPageState {

  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [];
}
