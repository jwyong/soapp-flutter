import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soapp/screens/auth/request_otp/request_otp.dart';
import 'package:soapp/utils/colors.dart';
import 'package:soapp/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return MaterialApp(
        title: 'Flutter Demo',

        // localisation
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,

        // theme
        theme: ThemeData(
          fontFamily: fontQuicksandBook,
          primaryColor: primary,
        ),

        // home
        home: RequestOtpScreen(),
      );
    });
  }
}
