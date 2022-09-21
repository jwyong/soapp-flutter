import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:soapp/screens/home/home_vm.dart';
import 'package:soapp/screens/home/soapp_tab/crypto_wallet/crypto_wallet_vm.dart';

import 'screens/auth/request_otp/request_otp.dart';
import 'screens/auth/request_otp/request_otp_vm.dart';
import 'screens/home/home.dart';
import 'screens/home/soapp_tab/crypto_wallet/crypto_wallet.dart';
import 'utils/colors.dart';
import 'utils/constants.dart';
import 'utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  EncryptedSharedPreferences()
      .getString(spKeyInitialRoute)
      .then((String? initialRoute) {
    runApp(Soapp(initialRoute));
  });
}

class Soapp extends StatelessWidget {
  const Soapp(this.initialRoute, {Key? key}) : super(key: key);
  final String? initialRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: soapp,

      // localisation
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      // theme
      theme: ThemeData(
        fontFamily: fontQuicksandBook,
        primaryColor: primary,
      ),

      // route
      routes: {
        routeRequestOtp: (context) => ChangeNotifierProvider.value(
            value: RequestOtpVM(), child: const RequestOtpScreen()),
        routeHome: (context) =>
            ChangeNotifierProvider.value(value: HomeVM(), child: const HomeScreen()),
        routeCryptoWallet: (context) => ChangeNotifierProvider.value(
            value: CryptoWalletVM(), child: const CryptoWalletScreen()),
      },
      home: ChangeNotifierProvider.value(
          value: RequestOtpVM(), child: const RequestOtpScreen()),

      // initialRoute based on where user left off last
      initialRoute: initialRoute ?? routeRequestOtp,
    );
  }
}
