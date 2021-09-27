import 'package:astro_tak/screens/ask_question_screens/ask_question_screen.dart';
import 'package:astro_tak/screens/bottom_navigation.dart';
import 'package:astro_tak/screens/home_screens/home_screen.dart';
import 'package:astro_tak/screens/reports_screens/report_screen.dart';
import 'package:astro_tak/screens/talk_to_astro_screens/talk_to_astro_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Navigation {
  static navigateToScreen(
      {required String? screenId, required RouteSettings settings}) {
    switch (screenId) {
      case BottomNavigation.id:
        return PageTransition(
          type: PageTransitionType.fade,
          curve: Curves.ease,
          child: BottomNavigation(),
        );
      case HomeScreen.id:
        return PageTransition(
          type: PageTransitionType.fade,
          curve: Curves.ease,
          child: HomeScreen(),
        );
      case TalkToAstroScreen.id:
        return PageTransition(
          type: PageTransitionType.fade,
          curve: Curves.ease,
          child: TalkToAstroScreen(),
        );
      case AskQuestionScreen.id:
        return PageTransition(
          type: PageTransitionType.fade,
          curve: Curves.ease,
          child: AskQuestionScreen(),
        );
      case ReportScreen.id:
        return PageTransition(
          type: PageTransitionType.fade,
          curve: Curves.ease,
          child: ReportScreen(),
        );
    }
  }
}
