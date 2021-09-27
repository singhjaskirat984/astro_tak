import 'package:astro_tak/components/button.dart';
import 'package:astro_tak/components/circle.dart';
import 'package:astro_tak/components/descriptions.dart';
import 'package:astro_tak/utilities/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";

class CustomerCard extends StatelessWidget {
  final String name;
  final String desText;
  final String review;

  const CustomerCard({Key? key, required this.name, required this.desText,required this.review,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: SizeConfig.screenWidth/1.2,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 2.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0,top: 30.0),
                  child: descriptions(
                      text:review,
                      size: 15.0,
                      color: Colors.black),
                ),
                SizedBox(height: 10.0,),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                            width: 50,
                            height: 50,
                            decoration: new BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.person,color: Colors.white,)
                        ),
                        SizedBox(height: 5.0,),
                        Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Roboto"),),
                        SizedBox(height: 5.0,),
                        descriptions(text: desText, size: 12.0, color: Colors.grey)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
