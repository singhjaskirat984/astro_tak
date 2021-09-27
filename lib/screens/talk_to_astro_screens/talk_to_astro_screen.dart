import 'package:astro_tak/components/AstroCard2.dart';
import 'package:astro_tak/providers/astrologer_provider.dart';
import 'package:astro_tak/utilities/colored_safe_area.dart';
import 'package:astro_tak/utilities/loading_enum.dart';
import 'package:astro_tak/utilities/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TalkToAstroScreen extends StatefulWidget {
  static const String id = 'talk_to_astro_screen';

  const TalkToAstroScreen({Key? key}) : super(key: key);

  @override
  _TalkToAstroScreenState createState() => _TalkToAstroScreenState();
}

class _TalkToAstroScreenState extends State<TalkToAstroScreen> {
  bool isSearch = false;
  TextEditingController txt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final astrologerDataProvider = Provider.of<AstrologerDataProvider>(context);
    return ColoredSafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                height: 35.0,
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
                    IconButton(
                        onPressed: (){
                          if(isSearch){
                            setState(() {
                              isSearch=false;
                            });
                            // context.read<AstrologerDataProvider>().revertData();
                          }else{
                            setState(() {
                              isSearch=true;
                            });
                          }
                          print("sdfbgnhn$isSearch");
                        },
                        icon: Container(
                          child: Image(
                            image: AssetImage(
                                "assets/images/search.png"
                            ),
                            fit: BoxFit.cover,
                          ),
                          height: 20,
                          width: 20,
                        ),),

                    IconButton(
                      onPressed: (){

                      },
                      icon: Container(
                        child: Image(
                          image: AssetImage(
                              "assets/images/filter.png"
                          ),
                          fit: BoxFit.cover,
                        ),
                        height: 20,
                        width: 20,
                      ),),

                    PopupMenuButton(
                      icon: Container(
                        child: Image(
                          image: AssetImage(
                              "assets/images/sort.png"
                          ),
                          fit: BoxFit.cover,
                        ),
                        height: 20,
                        width: 20,
                      ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text("Experience- High to Low"),
                            value: 1,
                            onTap: (){
                              context.read<AstrologerDataProvider>().sortExperience(false);
                            },
                          ),
                          PopupMenuItem(
                            child: Text("Experience- Low to High"),
                            value: 2,
                            onTap: (){
                              context.read<AstrologerDataProvider>().sortExperience(true);
                            },
                          ),
                          PopupMenuItem(
                            child: Text("Price- High to Low"),
                            value: 3,
                            onTap: (){
                              context.read<AstrologerDataProvider>().sortPrice(false);
                            },
                          ),
                          PopupMenuItem(
                            child: Text("Price- Low to High"),
                            value: 4,
                            onTap: (){
                              context.read<AstrologerDataProvider>().sortPrice(true);
                            },
                          ),
                        ]
                    ),

                  ],
                ),
              ),
            ),


            (isSearch) ? Container(
              height: 25,
              width: double.infinity,
              child: ListTile(
                leading: Icon(Icons.search,color: Colors.orange,),
                title:Container(
                  height: 22,
                  child: TextField(
                    controller: txt,
                    // onSubmitted: (String val){
                    //   print(val);
                    //   context.read<AstrologerDataProvider>().search(txt.text);
                    // },
                  ),
                )
              ),
            ) : Container(height: 0.0,),

            astrologerDataProvider.loadingStatus == LoadingStatus.completed ?
            Expanded(
              child: ListView.builder(
                itemCount: astrologerDataProvider.astrologerDataModel?.astrologerData.length,
                itemBuilder: (context, index){
                  final astroDetail = astrologerDataProvider.astrologerDataModel?.astrologerData[index];
                  final name = astroDetail!.firstName + " " + astroDetail.lastName.split(" ")[0];
                  final skill = astroDetail.skills.first;
                  final slug = astroDetail.skills.first;
                  final lang = astroDetail.languages[0] + "," + astroDetail.languages[1];
                  print(name);
                  return AstroCard2(image: astroDetail.images.first.large.imageUrl, name: name, text: skill, language: lang, charges: astroDetail!.minimumCallDurationCharges,exp: astroDetail!.experience,slug: slug,);
                },
              ),
            ) : Expanded(child: Center(child: CircularProgressIndicator()),)
          ],
        )
      ),
    );
  }
}

