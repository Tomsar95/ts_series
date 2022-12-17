part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent extends Equatable{
  const HomePageEvent();
}

class GetSeriesEvent extends HomePageEvent{
  @override
  List<Object?> get props => [];
}
