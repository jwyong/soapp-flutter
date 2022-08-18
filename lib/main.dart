import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:soapp/utils/colors.dart';
import 'package:soapp/utils/constants.dart';
import 'package:soapp/views/auth/request_otp/RequestOtpVM.dart';
import 'package:soapp/views/auth/request_otp/request_otp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return MultiProvider(
          providers: getProviders(context),
          child: MaterialApp(
            title: "Soapp",

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
    });
  }

  List<SingleChildWidget> getProviders(BuildContext context) {
    return [ChangeNotifierProvider.value(value: RequestOtpVM())];
  }
}
