import 'package:astro_tak/components/button.dart';
import 'package:astro_tak/components/custom_dialog.dart';
import 'package:astro_tak/components/descriptions.dart';
import 'package:astro_tak/utilities/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";

class AstroCard2 extends StatelessWidget {
  final String image;
  final String name;
  final String text;
  final String slug;
  final String language;
  final int charges;
  final int exp;

  const AstroCard2({Key? key,required this.image,required this.name,required this.text,required this.language,required this.charges,required this.exp,required this.slug}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: SizeConfig.screenHeight/3,
        child: Card(
          elevation: 2.0,
          child: Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: SizeConfig.screenHeight/6,
                    width: SizeConfig.screenWidth/3,
                    child: CachedNetworkImage(imageUrl: image, fit: BoxFit.fill,),
                  ),
                ),
              ),
              Container(
                width: SizeConfig.screenWidth/2,
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                                color: Colors.black),
                          ),
                          Text(
                            "${exp}",
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialogBox(title: name, descriptions: slug, text: "ok",image: image,);
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.person,color: Colors.orange,),
                            Text(
                              text.split(" ")[0]+" "+text.split(" ")[1],
                              style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.language,color: Colors.orange,),
                          SizedBox(width: 10.0,),
                          Text(
                            language,
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.monetization_on,color: Colors.orange,),
                          SizedBox(width: 10.0,),
                          Text(
                            "${charges}/min",
                            style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Button(txt: "Talk Now",),
                    )

                    // ListTile(
                    //   leading: Text(
                    //     name,
                    //     style: TextStyle(
                    //         fontFamily: "Roboto",
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 15.0,
                    //         color: Colors.black),
                    //   ),
                    //     trailing: Text(
                    //       "${exp} yrs",
                    //       style: TextStyle(
                    //           fontSize: 15.0,
                    //           color: Colors.grey
                    //       ),
                    //     ),
                    // ),
                    // ListTile(
                    //   leading: Icon(Icons.person,color: Colors.orange,),
                    //   title: Text(
                    //     text,
                    //     style: TextStyle(
                    //         fontSize: 12.0,
                    //         color: Colors.black
                    //     ),
                    //   ),
                    // ),
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
