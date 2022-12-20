import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/features/core/utils/custom_navigator.dart';
import 'package:tv_series/features/core/utils/utils.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';
import 'package:tv_series/features/series/presentation/blocs/airing_page_bloc/airing_page_bloc.dart';
import 'package:tv_series/features/series/presentation/widgets/recent_series/recent_series_scroll_widget.dart';
import 'package:tv_series/features/series/presentation/widgets/widgets.dart';
import 'package:tv_series/injection_container.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({Key? key}) : super(key: key);

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<AiringPageBloc>(),
      child: BlocBuilder<AiringPageBloc, AiringPageState>(
        builder: (context, state) {
          if (state is AiringPageInitial) {
            context.read<AiringPageBloc>().add(GetSeriesEvent());
            return loading();
          } else if (state is LoadedSeriesState) {
            return BuildView(
              listOfAiringSeries: state.listOfAiringSeries,
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

  final List<Series> listOfAiringSeries;

  const BuildView({Key? key, required this.listOfAiringSeries}) : super(key: key);

  @override
  State<BuildView> createState() => _BuildViewState();
}

class _BuildViewState extends State<BuildView> {

  late ScrollController _scrollControllerSeries;
  late List<Series> listOfAiringSeries;

  @override
  void initState() {
    _scrollControllerSeries = ScrollController();
    listOfAiringSeries = widget.listOfAiringSeries;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildPrincipalHeader(label: 'Recent', callBack: _closeSession),
        buildRecentScroll(listOfAiringSeries, context, _scrollControllerSeries),
      ],
    );
  }

  void _closeSession() {
    Utils.mustReset = true;
    Navigator.of(context).pushReplacementNamed(CustomRoutes.login);
  }
}