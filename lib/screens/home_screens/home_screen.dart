import 'package:astro_tak/components/astroCard.dart';
import 'package:astro_tak/components/button.dart';
import 'package:astro_tak/components/circle.dart';
import 'package:astro_tak/components/circle.dart';
import 'package:astro_tak/components/circle.dart';
import 'package:astro_tak/components/circle.dart';
import 'package:astro_tak/components/circle.dart';
import 'package:astro_tak/components/circle.dart';
import 'package:astro_tak/components/customerCard.dart';
import 'package:astro_tak/components/descriptions.dart';
import 'package:astro_tak/components/infoCard.dart';
import 'package:astro_tak/components/reportCard.dart';
import 'package:astro_tak/providers/astrologer_provider.dart';
import 'package:astro_tak/providers/horoscope_provider.dart';
import 'package:astro_tak/utilities/colored_safe_area.dart';
import 'package:astro_tak/utilities/constants.dart';
import 'package:astro_tak/utilities/loading_enum.dart';
import 'package:astro_tak/utilities/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final astrologerDataProvider = Provider.of<AstrologerDataProvider>(context);
    final hororscopeDataProvider = Provider.of<HororscopeDataProvider>(context);
    return ColoredSafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    descriptions(
                        text:
                            '""There is no better boat than\nhororscope to help a man\ncross over the sea of life""',
                        size: 17.0,
                        color: Colors.black),
                    SizedBox(
                      width: 15.0,
                    ),
                    Image.asset(
                      "assets/images/ganpati.jpg",
                      width: 80,
                      height: 80,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: SizeConfig.screenHeight / 4,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    infoCard(image: "assets/images/info1.png"),
                    infoCard(image: "assets/images/info2.png"),
                    infoCard(image: "assets/images/info1.png"),
                    infoCard(image: "assets/images/info2.png"),
                    infoCard(image: "assets/images/info1.png"),
                    infoCard(image: "assets/images/info2.png"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Daily Hororscopes",
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
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: descriptions(
                    text:
                        "Read your daily hororscope based on your sunsign, select your zodiac sign and give the right start to your day",
                    size: 17.0,
                    color: Colors.black),
              ),
              // Container(
              //   // color: Colors.red,
              //   margin: EdgeInsets.symmetric(vertical: 20.0),
              //   height: SizeConfig.screenHeight / 5.2,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: [
              //       circle(
              //         image: "assets/images/aries.png",
              //         txt: "Aries",
              //         desText: "March 21 - April 19",
              //       ),
              //       circle(
              //           image: "assets/images/aquarius.png",
              //           txt: "Aquarius",
              //           desText: "May 20 - June 20"),
              //       circle(
              //           image: "assets/images/capricorn.png",
              //           txt: "Capricorn",
              //           desText: "May 20 - June 20"),
              //       circle(
              //         image: "assets/images/gemini.png",
              //         txt: "Gemini",
              //         desText: "May 20 - June 20",
              //       ),
              //       circle(
              //           image: "assets/images/libra.png",
              //           txt: "Libra",
              //           desText: "May 20 - June 20"),
              //       circle(
              //           image: "assets/images/sagittarius.png",
              //           txt: "Sagittarius",
              //           desText: "May 20 - June 20"),
              //       circle(
              //           image: "assets/images/scorpio.png",
              //           txt: "Scorpio",
              //           desText: "May 20 - June 20"),
              //       circle(
              //         image: "assets/images/taurus.png",
              //         txt: "Taurus",
              //         desText: "April 20 - May 20",
              //       ),
              //       circle(
              //           image: "assets/images/virgo.png",
              //           txt: "Virgo",
              //           desText: "May 20 - June 20"),
              //     ],
              //   ),
              //   // color: Colors.red,
              // ),
              hororscopeDataProvider.loadingStatus == LoadingStatus.completed ?
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: SizeConfig.screenHeight /5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hororscopeDataProvider.hororscopeDataModel?.hororscopeData[0].data.length,
                  itemBuilder: (context, index){
                    final hororscopeDetail = hororscopeDataProvider.hororscopeDataModel?.hororscopeData[0].data[index];
                    return circle(name: hororscopeDetail!.name, date: hororscopeDetail.date,slug:hororscopeDetail.urlSlug ,);
                  },
                ),
              ) : CircularProgressIndicator(),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Talk to an Astrologer",
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
                        "Leading astrologers of India are just a phone call away. panel of astrologers not just provides solutions to your life problems but also guide you so that you can take the right\npath towards growth and prosperity ",
                    size: 17.0,
                    color: Colors.black),
              ),
              astrologerDataProvider.loadingStatus == LoadingStatus.completed ?
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: SizeConfig.screenHeight /2.2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: astrologerDataProvider.astrologerDataModel?.astrologerData.length,
                        itemBuilder: (context, index){
                          final astroDetail = astrologerDataProvider.astrologerDataModel?.astrologerData[index];
                          final name = astroDetail!.firstName + " " + astroDetail.lastName.split(" ")[0];
                          final skill = astroDetail.skills.first.split(" ")[0] + " " + astroDetail.skills.first.split(" ")[1];
                          print(name);
                          return AstroCard(image: astroDetail.images.first.large.imageUrl,txt:name , rating: astroDetail.rating, skills: skill,rate: astroDetail.minimumCallDurationCharges,);
                        },
                    ),
                  ) : CircularProgressIndicator(),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Reports",
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
                    "Astrology Report or what is commonly known as Hororscope report is basically an in depth look at your birth chart.\nHororscope report will look at various planetary positions in your birth charts and also derive relationships and angle to understand your personality and trait",
                    size: 17.0,
                    color: Colors.black),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: SizeConfig.screenHeight / 4,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ReportCard(
                        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWCdplDC1LQNvfIzi7yGt3bd6bPwuHw2xDxA&usqp=CAU",
                        txt: "RS.100",
                    ),
                    ReportCard(
                      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSryGva9jn_6N5Gr25yNiGTcWughpM9XO8jig&usqp=CAU",
                      txt: "RS.200",
                    ),
                    ReportCard(
                      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWCdplDC1LQNvfIzi7yGt3bd6bPwuHw2xDxA&usqp=CAU",
                      txt: "RS.100",
                    ),
                    ReportCard(
                      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSrZM20wlNhTLdRyHNIyE_HWdL_PZc_dnhgA&usqp=CAU",
                      txt: "RS.300",
                    ),
                    ReportCard(
                      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSkU92iYBnuk87Elzk6OOxYcaL6mopPc6eDw&usqp=CAU",
                      txt: "RS.400",
                    ),
                    ReportCard(
                      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzgghHD0RsXhJy960bn1mbc2DvRxu56s5gHw&usqp=CAU",
                      txt: "RS.500",
                    ),
                  ],
                ),
              ),
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
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hear from our Happy Customers",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: SizeConfig.screenHeight / 2.3,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CustomerCard(name: "Gagan Deep", desText: "Bhopal,India",review: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, \nhen an unknown printer took a galley of type and scrambled it to makeasesum.",),
                    CustomerCard(name: "Anurag Bali", desText: "Bhopal,India",review: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,\nwhen an unknown printer took a galley of type and scrambled it to maleaspsum.",),
                    CustomerCard(name: "Parmeet Singh", desText: "Bhopal,India",review: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500\n, when an unknown printer took a galley of type and scrambled it to rele Ipsum.",),
                    CustomerCard(name: "Gagan Kaur", desText: "Bhopal,India",review: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, \nhen an unknown printer took a galley of type and scrambled it to makeasesum.",),
                    CustomerCard(name: "Sahil Singh", desText: "Bhopal,India",review: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,\nwhen an unknown printer took a galley of type and scrambled it to maleaspsum.",),
                    CustomerCard(name: "Akshay Kumar", desText: "Bhopal,India",review: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s\n when an unknown printer took a galley of type and scrambled it to meleaIpsum.",)
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
