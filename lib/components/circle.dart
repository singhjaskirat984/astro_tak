import 'package:astro_tak/components/custom_dialog.dart';
import 'package:astro_tak/components/descriptions.dart';
import "package:flutter/material.dart";

class circle extends StatelessWidget {
  final String name;
  final String date,slug;

  const circle({Key? key, required this.name,required this.date,required this.slug})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialogBox(title: name, descriptions: slug, text: "ok",image:  name.toUpperCase() == "AQUARIUS" ? "assets/images/aquarius.png" :
              name.toUpperCase() == "ARIES" ? "assets/images/aries.png" :
              name.toUpperCase() == "CANCER" ? "assets/images/cancer.png" :
              name.toUpperCase() == "CAPRICORN" ? "assets/images/capricorn.png" :
              name.toUpperCase() == "GEMINI" ? "assets/images/gemini.png" :
              name.toUpperCase() == "LEO" ? "assets/images/leo.png" :
              name.toUpperCase() == "LIBRA" ? "assets/images/libra.png" :
              name.toUpperCase() == "PISCES" ? "assets/images/pisces.png" :
              name.toUpperCase() == "SAGITTARIUS" ? "assets/images/sagittarius.png" :
              name.toUpperCase() == "SCORPIO" ? "assets/images/scorpio.png" :
              name.toUpperCase() == "TAURUS" ? "assets/images/taurus.png" :
              "assets/images/virgo.png",);
            });
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
                width: 80,
                height: 80,
                decoration: new BoxDecoration(
                  color: Colors.blue[50],
                  shape: BoxShape.circle,
                ),
                child: Tab(
                  icon: Container(
                    child: Image(
                      image: AssetImage(
                        name.toUpperCase() == "AQUARIUS" ? "assets/images/aquarius.png" :
                        name.toUpperCase() == "ARIES" ? "assets/images/aries.png" :
                        name.toUpperCase() == "CANCER" ? "assets/images/cancer.png" :
                        name.toUpperCase() == "CAPRICORN" ? "assets/images/capricorn.png" :
                        name.toUpperCase() == "GEMINI" ? "assets/images/gemini.png" :
                        name.toUpperCase() == "LEO" ? "assets/images/leo.png" :
                        name.toUpperCase() == "LIBRA" ? "assets/images/libra.png" :
                        name.toUpperCase() == "PISCES" ? "assets/images/pisces.png" :
                        name.toUpperCase() == "SAGITTARIUS" ? "assets/images/sagittarius.png" :
                        name.toUpperCase() == "SCORPIO" ? "assets/images/scorpio.png" :
                        name.toUpperCase() == "TAURUS" ? "assets/images/taurus.png" :
                        "assets/images/virgo.png"
                      ),
                      fit: BoxFit.cover,
                    ),
                    height: 50,
                    width: 50,
                  ),
                )
            ),
            SizedBox(height: 5.0,),
            Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Roboto"),),
            SizedBox(height: 5.0,),
            descriptions(text: date, size: 12.0, color: Colors.grey)
          ],
        ),
      ),
    );
  }
}
