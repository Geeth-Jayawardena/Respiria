import 'package:resperia/notifiers/user_notifier.dart';
import 'package:resperia/routes.gr.dart';
import 'package:resperia/service_locator.dart';
import 'package:resperia/theme.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

var logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: primaryColor,
      // navigation bar color
      statusBarColor: primaryColor,
      // status bar color
      statusBarBrightness: Brightness.dark,
      //status bar brightness
      statusBarIconBrightness: Brightness.dark,
      //status barIcon Brightness
      systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon
    ),
  );

  setupServiceLocator();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('si'),
        Locale('ta'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => UserNotifier()),
      ], child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appRouter = getIt<AppRouter>();

    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, child) {
        child = FlutterEasyLoading(child: child);
        return child;
      },
      title: 'Resperia',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      routeInformationProvider: _appRouter.routeInfoProvider(),
    );
  }
}
