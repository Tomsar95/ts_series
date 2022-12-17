import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tv_series/features/core/utils/custom_navigator.dart';
import 'package:tv_series/features/core/utils/general_colors.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';
import 'package:tv_series/features/core/utils/utils.dart';
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

  const BuildView({Key? key, required this.listOfPopularSeries})
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
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 30.0),
              Text(
                'Home',
                style: CustomTextStyles.gilroyLightTitle.copyWith(fontSize: 20),
              ),
              Align(
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
            ],
          ),
        ),
        buildTitle('Popular'),
        listOfPopularSeries != null
            ? buildPopularScroll(listOfPopularSeries!)
            : scrollPlaceHolder(),
        const Divider(color: GeneralColors.darkGray),
        buildTitle('Recommendations'),
      ],
    );
  }

  Widget buildPopularScroll(List<Series> series) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 316.0,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            itemCount: series.length,
            itemBuilder: (context, index) {
              return Align(
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: 140,
                      decoration: setDecoration(series[index].posterPath),
                      margin: const EdgeInsets.all(10.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, bottom: 18),
                      child: SizedBox(
                        width: 140,
                        child: Text(
                          series[index].name,
                          maxLines: 2,
                          style: CustomTextStyles.gilroyLightTitle
                              .copyWith(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: RatingBar.builder(
                        initialRating: series[index].voteAverage / 2,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        ignoreGestures: true,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        unratedColor: GeneralColors.darkGray,
                        itemSize: 11,
                        allowHalfRating: true,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_outlined,
                          color: GeneralColors.lightGray,
                        ),
                        onRatingUpdate: (double value) {},
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'See All',
                style: CustomTextStyles.gilroyLightTitle
                    .copyWith(fontSize: 20, color: GeneralColors.yellow),
              ),
              const Icon(
                Icons.navigate_next,
                color: GeneralColors.yellow,
                size: 26,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget scrollPlaceHolder() {
    return SizedBox(
      height: 220.0,
      width: MediaQuery.of(context).size.width,
      child: Text(
        'Ops, there are no series available',
        style:
            CustomTextStyles.gilroyBold.copyWith(color: GeneralColors.darkGray),
      ),
    );
  }

  Widget buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomTextStyles.gilroyBold.copyWith(fontSize: 26),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  BoxDecoration setDecoration(String? imgPath) {
    if (imgPath == null) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: GeneralColors.black,
      );
    } else {
      return BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          image:
              DecorationImage(image: NetworkImage(imgPath), fit: BoxFit.cover));
    }
  }

  void _closeSession() {
    Utils.mustReset = true;
    Navigator.of(context).pushReplacementNamed(CustomRoutes.login);
  }
}
