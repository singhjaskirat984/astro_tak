import "package:flutter/material.dart";

class infoCard extends StatelessWidget {
  final String image;

  const infoCard({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 400.0,
        width: 240.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                image),
            fit: BoxFit.fill,
          ),
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }
}
