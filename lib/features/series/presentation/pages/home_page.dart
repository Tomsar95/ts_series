import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/features/core/utils/custom_navigator.dart';
import 'package:tv_series/features/core/utils/general_colors.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';
import 'package:tv_series/features/core/utils/utils.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';
import 'package:tv_series/features/series/presentation/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:tv_series/features/series/presentation/widgets/popular_series_scroll_widget.dart';
import 'package:tv_series/features/series/presentation/widgets/recommended_series_scroll_widget.dart';
import 'package:tv_series/features/series/presentation/widgets/widgets.dart';
import 'package:tv_series/injection_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<HomePageBloc>(),
      child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          if (state is HomePageInitial) {
            context.read<HomePageBloc>().add(GetSeriesEvent());
            return loading();
          } else if (state is LoadedSeriesState) {
            return BuildView(
              listOfPopularSeries: state.listOfPopularSeries,
              listOfRecommendedSeries: state.listOfRecommendedSeries,
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
  final List<Series>? listOfPopularSeries;
  final List<Series>? listOfRecommendedSeries;

  const BuildView({Key? key, this.listOfPopularSeries, this.listOfRecommendedSeries})
      : super(key: key);

  @override
  State<BuildView> createState() => _BuildViewState();
}

class _BuildViewState extends State<BuildView> {
  late ScrollController _scrollControllerPopularSeries;
  late List<Series>? listOfPopularSeries;
  late List<Series>? listOfRecommendedSeries;

  @override
  void initState() {
    _scrollControllerPopularSeries = ScrollController();
    listOfPopularSeries = widget.listOfPopularSeries;
    listOfRecommendedSeries = widget.listOfRecommendedSeries;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, left: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 30.0),
                Text(
                  'Home',
                  style: CustomTextStyles.gilroyLightTitle.copyWith(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: () {
                          _closeSession();
                        },
                        child: const Icon(
                          Icons.settings_outlined,
                          color: GeneralColors.darkGray,
                          size: 30,
                        )),
                  ),
                ),
              ],
            ),
          ),
          buildTitle('Popular'),
          listOfPopularSeries != null
              ? buildPopularScroll(listOfPopularSeries!, context, _scrollControllerPopularSeries)
              : scrollPlaceHolder(context),
          const Padding(
            padding: EdgeInsets.only( right: 20.0),
            child: Divider(color: GeneralColors.darkGray),
          ),
          buildTitle('Recommendations'),
          listOfPopularSeries != null
              ? Expanded(child: buildRecommendedScroll(listOfRecommendedSeries!, context, _scrollControllerPopularSeries))
              : scrollPlaceHolder(context),
        ],
      ),
    );
  }

  void _closeSession() {
    Utils.mustReset = true;
    Navigator.of(context).pushReplacementNamed(CustomRoutes.login);
  }
}
