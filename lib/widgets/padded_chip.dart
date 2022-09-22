import 'package:flutter/material.dart';
import 'package:soapp/utils/ui_functions.dart';

class PaddedChipWidget extends StatelessWidget {
  const PaddedChipWidget(this.label,
      {super.key, this.marginHori = 3.5, this.isFirstItem = false, this.bgColour});

  final String? label;
  final double marginHori;
  final bool isFirstItem;
  final Color? bgColour;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: isFirstItem
            ? EdgeInsets.only(right: marginHori)
            : EdgeInsets.symmetric(horizontal: marginHori),
        child: Chip(
          backgroundColor: bgColour,
            label: Text(
          label?.toCapitalized() ?? '',
          style: Theme.of(context).textTheme.bodySmall,
        )));
  }
}
