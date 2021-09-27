import 'package:astro_tak/components/AstroCard2.dart';
import 'package:astro_tak/providers/astrologer_provider.dart';
import 'package:astro_tak/utilities/colored_safe_area.dart';
import 'package:astro_tak/utilities/loading_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatefulWidget {
  static const String id = 'report_screen';

  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    final astrologerDataProvider = Provider.of<AstrologerDataProvider>(context);
    return ColoredSafeArea(
      child: Scaffold(
        body: astrologerDataProvider.loadingStatus == LoadingStatus.completed ?
        ListView.builder(
          itemCount: astrologerDataProvider.astrologerDataModel?.astrologerData.length,
          itemBuilder: (context, index){
            final astroDetail = astrologerDataProvider.astrologerDataModel?.astrologerData[index];
            final name = astroDetail!.firstName + " " + astroDetail.lastName.split(" ")[0];
            final skill = astroDetail.skills.first.split(" ")[0]+ " " + astroDetail.skills.first.split(" ")[1];
            final slug = astroDetail.skills.first;
            final lang = astroDetail.languages[0] + "," + astroDetail.languages[1];
            print(name);
            return AstroCard2(image: astroDetail.images.first.large.imageUrl, name: name, text: skill, language: lang, charges: astroDetail!.minimumCallDurationCharges,exp: astroDetail!.experience,slug: slug,);
          },
        ) : CircularProgressIndicator(),
      ),
    );
  }
}
