import 'package:tv_series/features/core/utils/utils.dart';

class GeneralFunctions {

  static String? setImageRouteCard(String? initialPAth){
    if(initialPAth == null) return null;
    return '${Utils.imagesRootCards}$initialPAth';
  }

  static String? setImageRouteBG(String? initialPAth){
    if(initialPAth == null) return null;
    return '${Utils.imagesRootBG}$initialPAth';
  }

}