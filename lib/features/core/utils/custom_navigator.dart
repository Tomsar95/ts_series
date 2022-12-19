import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/custom_arguments.dart';
import 'package:tv_series/features/login/presentation/pages/login_screen.dart';
import 'package:tv_series/features/series/presentation/pages/episodes_page.dart';
import 'package:tv_series/features/series/presentation/pages/home_screen.dart';
import 'package:tv_series/features/series/presentation/pages/popular_series_carousel_page.dart';

class CustomNavigator {
  static Route<dynamic> routes(RouteSettings settings) {
    final route = settings.name?.split('/');
    if (route != null) {
      switch (route[0]) {
        case CustomRoutes.home:
          return defaultRoute(const HomeScreen());
        case CustomRoutes.login:
          return defaultRoute(const LoginScreen());
        case CustomRoutes.popularCarrousel:
          final PopularSeriesScreenArguments args =
              settings.arguments as PopularSeriesScreenArguments;
          return defaultRoute(PopularSeriesCarouselPage(
            initialPosition: args.initialPosition,
            popularSeries: args.popularSeries,
          ));
        case CustomRoutes.episodeDetails:
          final EpisodeDetailsArguments args =
              settings.arguments as EpisodeDetailsArguments;
          return defaultRoute(EpisodesPage(
            showId: args.showId,
            showNumber: args.seasonNumber,
          ));
        default:
          return defaultRoute(const LoginScreen());
      }
    }
    return defaultRoute(const LoginScreen());
  }
}

MaterialPageRoute defaultRoute<T extends Widget>(T child) {
  return MaterialPageRoute<T>(builder: (BuildContext context) => child);
}

class CustomRoutes {
  static const String popularCarrousel = "popular_carrousel";
  static const String episodeDetails = "episode_details";
  static const String home = "home";
  static const String login = "login";
}
