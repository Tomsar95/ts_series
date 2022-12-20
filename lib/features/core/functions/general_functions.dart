import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/utils.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';

class GeneralFunctions {

  static String? setImageRouteCard(String? initialPAth){
    if(initialPAth == null) return null;
    return '${Utils.imagesRootCards}$initialPAth';
  }

  static String? setImageRouteBG(String? initialPAth){
    if(initialPAth == null) return null;
    return '${Utils.imagesRootBG}$initialPAth';
  }

  static bool checkFavorites(Series series) {
    bool exist = false;
    if (Utils.favoriteSeries.isEmpty) return false;
    for (var element in Utils.favoriteSeries) {
      if (element.id == series.id) {
        exist = true;
        break;
      }
    }
    return exist;
  }

  static addToFavorites(BuildContext context, Series series) {
    Utils.favoriteSeries.add(series);
  }

  static removeFromFavorites(BuildContext context, Series series) {
    Utils.favoriteSeries.removeWhere((element) => element.name == series.name);
  }
}