import 'package:astro_tak/providers/astrologer_provider.dart';
import 'package:astro_tak/providers/connectivity_service_provider.dart';
import 'package:astro_tak/providers/horoscope_provider.dart';
import 'package:astro_tak/providers/question_data_provider.dart';
import 'package:astro_tak/screens/bottom_navigation.dart';
import 'package:astro_tak/utilities/constants.dart';
import 'package:astro_tak/utilities/navigation.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConnectivityServiceProvider()),
        ChangeNotifierProvider(create: (_) => QuestionsDataProvider()),
        ChangeNotifierProvider(create: (_) => AstrologerDataProvider()),
        ChangeNotifierProvider(create: (_) => HororscopeDataProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Astro Tak',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.orange,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.orange),
        ),
        iconTheme: IconThemeData(color: Colors.orange, size: 25),
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: kTextColor, fontWeight: FontWeight.w400),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w500,
            color: kTextColor,
          ),
          subtitle1: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: kTextColor,
          ),
          bodyText1: TextStyle(
            fontSize: 17.0,
            color: kTextColor,
          ),
          button: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: kTextColor,
          ),
        ),
      ),
      initialRoute: BottomNavigation.id,
      onGenerateRoute: (settings) {
        print(
            'Navigation to ${settings.name} arguments: ${settings.arguments}');
        return Navigation.navigateToScreen(
            screenId: settings.name, settings: settings);
      },
    );
  }
}
