import 'package:tv_series/features/core/utils/utils.dart';

class GeneralFunctions {

  static String? setImageRoute(String? initialPAth){
    if(initialPAth == null) return null;
    return '${Utils.imagesRoot}$initialPAth';
  }

}