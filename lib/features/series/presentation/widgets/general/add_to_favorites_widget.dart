import 'package:flutter/material.dart';
import 'package:tv_series/features/core/functions/general_functions.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/core/utils/utils.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';

class AddToFavorites extends StatefulWidget {
  final BuildContext context;
  final Series series;
  final bool isDark;

  const AddToFavorites({Key? key, required this.context, required this.series, this.isDark = false})
      : super(key: key);

  @override
  State<AddToFavorites> createState() => _AddToFavoritesState();
}

class _AddToFavoritesState extends State<AddToFavorites> {
  late BuildContext parentContext;

  @override
  void initState() {
    parentContext = widget.context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorite = GeneralFunctions.checkFavorites(widget.series);

    if (isFavorite) {
      return GestureDetector(
          onTap: () {
            GeneralFunctions.removeFromFavorites(context, widget.series);
            setState(() {});
          },
          child: Icon(
            Icons.favorite,
            color: widget.isDark ? CustomColors.yellow.withOpacity(0.3) : CustomColors.yellow,
            size: 30,
          ));
    } else {
      return GestureDetector(
          onTap: () {
            GeneralFunctions.addToFavorites(context, widget.series);
            setState(() {});
          },
          child: const Icon(
            Icons.favorite_border,
            color: CustomColors.darkGray,
            size: 30,
          ));
    }
  }
}
