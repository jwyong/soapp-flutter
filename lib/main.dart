import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'utils/colors.dart';
import 'utils/constants.dart';
import 'views/auth/request_otp/request_otp_vm.dart';
import 'views/auth/request_otp/request_otp.dart';

void main() {
  runApp(const Soapp());
}

class Soapp extends StatelessWidget {
  const Soapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: _getProviders(context),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Soapp',

          // localisation
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,

          // theme
          theme: ThemeData(
            fontFamily: fontQuicksandBook,
            primaryColor: primary,
          ),

          // home
          home: const RequestOtpScreen(),
        ));
  }

  List<SingleChildWidget> _getProviders(BuildContext context) {
    return [ChangeNotifierProvider.value(value: RequestOtpVM())];
  }
}
