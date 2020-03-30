import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:auction_house_app/src/resources/resources.dart';
import 'package:auction_house_app/src/pages/pages.dart';
import 'package:auction_house_app/src/providers/providers.dart';
import 'package:auction_house_app/src/repository/repository.dart';
import 'package:auction_house_app/src/i18n/i18n.dart';


import 'app_config.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context);
    final dio = Dio(BaseOptions(baseUrl: config.apiBaseUrl));
    final repository = Repository(dio);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuctionBloc(repository)),
      ],
      child: MaterialApp(
        navigatorKey: config.navigatorKey,
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: SplashPage(),
        supportedLocales: [
          const Locale.fromSubtags(languageCode: 'en'),
          const Locale.fromSubtags(languageCode: 'zh'),
          const Locale.fromSubtags(languageCode: 'pt'),
        ],
        localizationsDelegates: [
          const I18nLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}
