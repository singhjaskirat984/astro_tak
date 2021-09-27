import 'package:astro_tak/components/button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";

class AstroCard extends StatelessWidget {
  final String image;
  final String txt;
  final String rating;
  final String skills;
  final int rate;

  const AstroCard({Key? key, required this.image, required this.txt, required this.rating, required this.skills, required this.rate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 200.0,
                width: 240.0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(15),
                      child: CachedNetworkImage(imageUrl: image, fit: BoxFit.fill,)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(txt,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Roboto",fontSize: 20.0),),
                  SizedBox(width: 60.0,),
                  Text(rating,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Roboto",color: Colors.orange,fontSize: 20.0),),
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(skills,style: TextStyle(fontFamily: "Roboto",color: Colors.grey,fontSize: 20.0),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: Row(
                children: [
                  Text("RS.${rate}/min",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Roboto",fontSize: 20.0),),
                  SizedBox(width: 15.0,),
                  Button(txt: "Talk Now",)
                ],
              ),
            ),



          ],
        ),
      )
    );
  }
}
