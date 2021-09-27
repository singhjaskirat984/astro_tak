import 'package:astro_tak/components/button.dart';
import 'package:astro_tak/utilities/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  final String image;
  final String txt;

  const ReportCard({Key? key,required this.image,required this.txt}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ), 
        child: Stack(
          children: [
            Container(
                width: SizeConfig.screenWidth/1.5,
                height: SizeConfig.screenHeight/4,
                child: ClipRRect(
                    borderRadius:
                    BorderRadius.circular(15),
                    child: CachedNetworkImage(imageUrl: image,fit: BoxFit.fill,))),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(15),
                child: Container(
                  height: 50.0,
                  width: SizeConfig.screenWidth/1.5,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(txt,style: TextStyle(color: Colors.white,fontSize: 17.0),)
                  ),
                ),
                SizedBox(width: 50,),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Button(txt: "Buy Now",)
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
