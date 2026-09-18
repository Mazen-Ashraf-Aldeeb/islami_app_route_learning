import 'package:flutter/material.dart';
import 'package:islami_app/core/Colors/app_colors.dart';
import 'package:islami_app/core/constant/sura_model.dart';
import 'package:islami_app/modules/suradetails/screens/quran_details_screen.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/taj-mahal-agra-india 1.png",),fit: BoxFit.cover,

        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColors.black.withValues(alpha: 0.7),
                  AppColors.black
                ],
                  end: Alignment.bottomCenter
                )
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Image.asset("assets/logo/home_logo.png",width: 300,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ListView.separated(
                            itemCount: SuraModel.getAllSura().length,
                            itemBuilder: (context, index) {
                              var sura = SuraModel.getAllSura()[index];
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return QuranDetailsScreen(sura: sura,);
                                  },));
                                },
                                child: Row(
                                  children: [
                                    Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset("assets/images/Vector (1).png",width: 52,height: 52,),
                                          Text((sura.id+1).toString(),style: TextStyle(color: AppColors.white,fontSize: 20,fontWeight: FontWeight.w700),)
                                        ]
                                    ),
                                     SizedBox(width: 24,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(sura.nameEn,style: TextStyle(color: AppColors.white,fontSize: 20,fontWeight: FontWeight.w700),),
                                        Text("${sura.ayaNumber} Verses",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: AppColors.white),),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(sura.nameAr,style: TextStyle(color: AppColors.white,fontWeight: FontWeight.w700,fontSize: 20),)
                                  ],
                                ),
                              );
                            }, separatorBuilder: (BuildContext context, int index) {
                              return Divider(indent: 50,endIndent: 50,height: 24,);
                        },

                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
