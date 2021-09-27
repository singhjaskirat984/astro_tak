//    final homeDataProvider = Provider.of<HomeDataProvider>(context);
// homeDataProvider.loadingStatus ==
//                           LoadingStatus.completed


import 'package:astro_tak/components/button.dart';
import 'package:astro_tak/components/descriptions.dart';
import 'package:astro_tak/utilities/colored_safe_area.dart';
import 'package:astro_tak/utilities/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AskQuestionScreen extends StatefulWidget {
  static const String id = 'ask_question_screen';

  const AskQuestionScreen({Key? key}) : super(key: key);

  @override
  _AskQuestionScreenState createState() => _AskQuestionScreenState();
}

class _AskQuestionScreenState extends State<AskQuestionScreen> {



  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ask a Question",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black),
                  ),
                  Text(
                    "See All>",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.orange),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: descriptions(
                  text:
                  "Seek accurate answers to your life problems and guide you towards the right path whether the problems is related to love, self, life, business, money, education or work, our astrologers will do an in depth study of your birth chart provide personalized responses along with remedies",
                  size: 17.0,
                  color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: Colors.lightBlue[50],
                height: SizeConfig.screenHeight/4.2,
                width: SizeConfig.screenWidth,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 20.0),
                        child: Text(
                          "Choose a Category",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: SizeConfig.screenWidth,
                          color: Colors.white,
                          child: DropdownButton<String>(
                            items: <String>['Axzccxzcc', 'Bzxcxcxzczcx', 'Cxzczxczc', 'Dxccxzczczxcx'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
                            hint:Text(
                              "Select a Category: Love, Career, More",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            iconDisabledColor: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "RS.99",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(width: 40.0),
                          Text(
                            "ideas what to ask",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black),
                          ),
                          SizedBox(width: 5.0),
                          Button(txt:"Ask a Quest."),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
