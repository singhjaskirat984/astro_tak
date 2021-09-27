import 'package:astro_tak/providers/astrologer_provider.dart';
import 'package:astro_tak/providers/horoscope_provider.dart';
import 'package:astro_tak/providers/question_data_provider.dart';
import 'package:astro_tak/screens/ask_question_screens/ask_question_screen.dart';
import 'package:astro_tak/screens/home_screens/home_screen.dart';
import 'package:astro_tak/screens/network_connectivity/network_connectivity.dart';
import 'package:astro_tak/screens/reports_screens/report_screen.dart';
import 'package:astro_tak/screens/talk_to_astro_screens/talk_to_astro_screen.dart';
import 'package:astro_tak/utilities/colored_safe_area.dart';
import 'package:astro_tak/utilities/constants.dart';
import 'package:astro_tak/utilities/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);
  static const String id = 'bottom_navigation';

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedPage = 0;

  svgImage({required String assetName, required int index}) {
    return SvgPicture.asset(
      'assets/icons/$assetName.svg',
      height: 25.0,
      color: (_selectedPage == index) ? selectedColor : unselectedColor,
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<QuestionsDataProvider>().fetchQuestionsData();
    context.read<AstrologerDataProvider>().fetchAstrologerData();
    context.read<HororscopeDataProvider>().fetchHororscopeData();
    // context.read<AstrologerDataProvider>().storeData();
  }

  List<Widget> _buildScreens() {
    return [
      NetworkConnectivity(child: HomeScreen()),
      NetworkConnectivity(child: TalkToAstroScreen()),
      NetworkConnectivity(child: AskQuestionScreen()),
      NetworkConnectivity(child: ReportScreen()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Tab(icon: Image.asset("assets/images/logo.png")),
        leading: Tab(
          icon: Container(
            child: Image(
              image: AssetImage(
                'assets/images/hamburger.png',
              ),
              fit: BoxFit.cover,
            ),
            height: 20,
            width: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Tab(
              icon: Container(
                child: Image(
                  image: AssetImage(
                    'assets/images/profile.png',
                  ),
                  fit: BoxFit.cover,
                ),
                height: 30,
                width: 30,
              ),
            ),
          )
        ],
        centerTitle: true,
      ),
      body: ColoredSafeArea(
        child: _buildScreens()[_selectedPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        showUnselectedLabels: true,
        backgroundColor: bottomColor,
        elevation: 5.0,
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        selectedFontSize: 12.0,
        unselectedFontSize: 10.0,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 6.0,top: 5.0),
              child: ImageIcon(
                AssetImage('assets/images/home.png'),
                size: 22,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Talk',
            icon:  Padding(
              padding: const EdgeInsets.only(bottom: 6.0,top: 5.0),
              child: ImageIcon(
                AssetImage('assets/images/talk.png'),
                size: 22,
              ),
            ),//svgImage(assetName: 'day_night_icon', index: 1),
          ),
          BottomNavigationBarItem(
            label: 'Ask Question',
            icon:Padding(
              padding: const EdgeInsets.only(bottom: 6.0,top: 5.0),
              child: ImageIcon(
                AssetImage('assets/images/ask.png'),
                size: 22,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Reports',
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 6.0,top: 5.0),
              child: ImageIcon(
                AssetImage('assets/images/reports.png'),
                size: 22,
              ),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
      ),
    );
  }
}
