import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/Colors/app_colors.dart';
import 'package:islami_app/core/constant/sura_model.dart';

class QuranDetailsScreen extends StatefulWidget {
  SuraModel sura;
  QuranDetailsScreen({super.key, required this.sura});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> suraList = [];

  @override
  Widget build(BuildContext context) {
    if (suraList.isEmpty) {
      readFile();
    }
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        surfaceTintColor: AppColors.black,
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.gold,
        title: Text(widget.sura.nameEn),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Image.asset("assets/images/img_left_corner.png"),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      widget.sura.nameAr,
                      style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Image.asset("assets/images/img_right_corner.png"),
                ),
              ],
            ),

            // Expanded(
            //   child: ListView.builder(
            //     itemCount: suraList.length,
            //     itemBuilder: (context, index) {
            //     return Container(
            //       margin: EdgeInsetsGeometry.all(4),
            //       padding: EdgeInsets.all(16),
            //       decoration: BoxDecoration(
            //         border: Border.all(color: AppColors.gold),
            //         borderRadius: BorderRadius.circular(16)
            //       ),
            //       child: Center(child: Text("${suraList[index]}  [${index + 1}]",style: TextStyle(
            //
            //         color: AppColors.gold,fontWeight: FontWeight.w700 ,fontSize: 16 ,
            //       ),textAlign: TextAlign.center,textDirection: TextDirection.rtl,)),
            //     );
            //   },),
            // )
            Expanded(
              child: SingleChildScrollView(
                child: Text.rich(
                  TextSpan(
                    children: suraList.map((e) {
                      int index = suraList.indexOf(e);
                      return TextSpan(text: " $e [${index + 1}]  ");
                    }).toList(),
                  ),
                  style: TextStyle(
                    color: AppColors.gold,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    height: 3,
                  ),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void readFile() async {
    String data = await rootBundle.loadString(
      "assets/Suras/${widget.sura.id + 1}.txt",
    );
    data = data.trim();
    suraList = data.split("\n");
    print(suraList);
    setState(() {});
  }
}
