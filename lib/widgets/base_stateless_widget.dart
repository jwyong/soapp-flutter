import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class BaseStatelessWidget extends StatelessWidget with BaseFunctions {
  const BaseStatelessWidget({Key? key}) : super(key: key);
}

abstract class BaseStatefulWidget extends StatefulWidget with BaseFunctions {
  const BaseStatefulWidget({Key? key}) : super(key: key);
}

mixin BaseFunctions on Widget {
  // you can also constrain the mixin to specific classes using on in this line.
  // get localised string based on string name
  AppLocalizations? getString(BuildContext context) =>
      AppLocalizations.of(context);

  // get text style
  TextTheme getStyle(BuildContext context) => Theme.of(context).textTheme;
}
