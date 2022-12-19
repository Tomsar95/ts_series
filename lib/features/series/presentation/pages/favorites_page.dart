import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/features/core/utils/custom_navigator.dart';
import 'package:tv_series/features/core/utils/utils.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';
import 'package:tv_series/features/series/presentation/blocs/favorites_page_bloc/favorites_page_bloc.dart';
import 'package:tv_series/features/series/presentation/widgets/favorite_series/favorite_series_scroll_widget.dart';
import 'package:tv_series/features/series/presentation/widgets/widgets.dart';
import 'package:tv_series/injection_container.dart';


class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<FavoritesPageBloc>(),
      child: BlocBuilder<FavoritesPageBloc, FavoritesPageState>(
        builder: (context, state) {
          if (state is FavoritesPageInitial) {
            context.read<FavoritesPageBloc>().add(GetSeriesEvent());
            return loading();
          } else if (state is LoadedSeriesState) {
            return BuildView(
              listOfFavoriteSeries: state.listOfFavoriteSeries,
            );
          } else if (state is ErrorState) {
            return MessageDisplay(message: state.message);
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: const Placeholder(),
          );
        },
      ),
    );
  }
}

class BuildView extends StatefulWidget {

  final List<Series> listOfFavoriteSeries;

  const BuildView({Key? key, required this.listOfFavoriteSeries}) : super(key: key);

  @override
  State<BuildView> createState() => _BuildViewState();
}

class _BuildViewState extends State<BuildView> {

  late ScrollController _scrollControllerSeries;
  late List<Series> listOfFavoriteSeries;

  @override
  void initState() {
    _scrollControllerSeries = ScrollController();
    listOfFavoriteSeries = widget.listOfFavoriteSeries;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildPrincipalHeader(label: 'Favorites', callBack: _closeSession),
          buildFavoritesScroll(listOfFavoriteSeries, context, _scrollControllerSeries),
        ],
      ),
    );
  }

  void _closeSession() {
    Utils.mustReset = true;
    Navigator.of(context).pushReplacementNamed(CustomRoutes.login);
  }
}

