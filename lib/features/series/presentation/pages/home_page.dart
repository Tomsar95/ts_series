import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/features/core/utils/custom_navigator.dart';
import 'package:tv_series/features/core/utils/general_colors.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';
import 'package:tv_series/features/core/utils/utils.dart';
import 'package:tv_series/features/login/domain/entities/user.dart';
import 'package:tv_series/features/login/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';
import 'package:tv_series/features/series/presentation/blocs/home_page_bloc/home_page_bloc.dart';
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
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  if (state is HomePageInitial) {
                    context.read<HomePageBloc>().add(GetSeriesEvent());
                    return loading();
                  } else if (state is LoadedSeriesState) {
                    return BuildView(
                      listOfPopularSeries: state.listOfPopularSeries,
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildView extends StatefulWidget {
  final List<Series>? listOfPopularSeries;

  const BuildView(
      {Key? key,
      required this.listOfPopularSeries})
      : super(key: key);

  @override
  State<BuildView> createState() => _BuildViewState();
}

class _BuildViewState extends State<BuildView> {
  late ScrollController _scrollController;
  late List<Series>? listOfPopularSeries;
  late List<Series>? listOfRecommendedSeries;

  @override
  void initState() {
    _scrollController = ScrollController();
    listOfPopularSeries = widget.listOfPopularSeries;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 100,
        ),
        Text(
          'Home',
          style: CustomTextStyles.gilroyBold,
        ),
        const SizedBox(
          height: 100,
        ),
        GestureDetector(
            onTap: () {
              _closeSession();
            },
            child: const Icon(Icons.settings_outlined)),
        const SizedBox(
          height: 100,
        ),
        listOfPopularSeries != null
            ? SizedBox(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    itemCount: listOfPopularSeries!.length,
                    itemBuilder: (context, index) {
                      return Align(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36.0),
                            color: GeneralColors.yellow,
                          ),
                          margin: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(listOfPopularSeries![index].name),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  void _closeSession() {
    Utils.mustReset = true;
    Navigator.of(context).pushReplacementNamed(CustomRoutes.login);
  }
}
