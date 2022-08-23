import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:soapp/screens/home/soapp_tab/crypto_wallet/crypto_wallet.dart';

import 'screens/auth/request_otp/request_otp.dart';
import 'screens/auth/request_otp/request_otp_vm.dart';
import 'screens/home/home.dart';
import 'utils/colors.dart';
import 'utils/constants.dart';
import 'utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  EncryptedSharedPreferences().getString(spKeyInitialRoute).then((String? value) {
    runApp(Soapp(value));
  });
}

class Soapp extends StatelessWidget {
  const Soapp(this.initialRoute, {Key? key}) : super(key: key);
  final String? initialRoute;

  @override
  Widget build(BuildContext context) {
    debugPrint("JAY_LOG: Soapp, build, loginStg = $initialRoute");

    return MultiProvider(
        providers: _getProviders(context),
        child: MaterialApp(
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
            routeHome: (context) => const HomeScreen(),
            routeDefault: (context) => const RequestOtpScreen(),
            routeCryptoWallet: (context) => const CryptoWalletScreen(),
          },

          // initialRoute based on where user left off last
          initialRoute: initialRoute?? routeDefault,
        ));
  }

  // get list of providers
  List<SingleChildWidget> _getProviders(BuildContext context) {
    return [ChangeNotifierProvider.value(value: RequestOtpVM())];
  }
}
