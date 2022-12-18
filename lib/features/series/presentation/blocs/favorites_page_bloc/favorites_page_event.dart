part of 'favorites_page_bloc.dart';

abstract class FavoritesPageEvent extends Equatable {
  const FavoritesPageEvent();
}

class GetSeriesEvent extends FavoritesPageEvent{
  @override
  List<Object?> get props => [];
}
