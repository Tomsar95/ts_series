import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/text_styles.dart';

class MessageDisplay extends StatelessWidget {
  final String message;
  const MessageDisplay({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50),
      child: Center(
        child: Text(
          message,
          style: CustomTextStyles.gilroyLight,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
