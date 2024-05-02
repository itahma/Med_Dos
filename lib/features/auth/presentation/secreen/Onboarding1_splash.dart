import 'package:flutter/material.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/routes/app_routes.dart';
import 'package:med_dos/core/utils/app_assets.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/widget/app_string.dart';
import 'package:med_dos/core/utils/widget/customimage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../app/app.dart';
class BoardingModel{
  final String image;
  final String body;
  BoardingModel({
    required this.body,
    required this.image,
});
}

class OnBoarding1Screen extends StatefulWidget {
   const OnBoarding1Screen({Key? key}) : super(key: key);

  @override
  State<OnBoarding1Screen> createState() => _OnBoarding1ScreenState();
}

class _OnBoarding1ScreenState extends State<OnBoarding1Screen> {
   var boardController = PageController();

List<BoardingModel>boarding=[
  BoardingModel(

    image: AppAssets.Onboarding1,
    body: AppString.onBoarding1,

  ),
  BoardingModel(
    image: AppAssets.Onboarding2,
    body:AppString.onBoarding2,
  ),
  BoardingModel(
    image: AppAssets.Onboarding3,
    body: AppString.onBoarding3,
  ),
  BoardingModel(
    image: AppAssets.Onboarding4,
    body: AppString.onBoarding4,
  ),
];
bool isLast=false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: (){
              Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.login,
                      (Route<dynamic> route) =>false);
            },
              child:  Text(AppString.skip.tr(context)),
          ),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged:(int index) {
                  if (index==boarding.length-1){
                    setState(() {
                      isLast=true;
                    });
                  }else{
                    setState(() {
                      isLast=false;
                    });
                  }
                },
                controller: boardController,
                itemBuilder: (context,index)=>
                    buildBoardingItem(context,boarding[index]),
                itemCount: boarding.length,
              ),
            ) ,
            const SizedBox(height: 40,),
            Row(
              children: [
                SmoothPageIndicator(
                  effect: const ExpandingDotsEffect(
                    dotColor:AppColors.grey,
                    activeDotColor: AppColors.blue,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5,

                  ),
                    controller: boardController,
                    count: boarding.length,
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: AppColors.blue,
                  onPressed:(){
                    if(isLast){
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.login,
                              (Route<dynamic> route) =>false);
                    }
                    else
                    {
                      boardController.nextPage(
                        duration: const Duration(
                          microseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }

                  },
                child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),

          ],
        ),
      )

    );
  }
}

Widget buildBoardingItem(BuildContext context,BoardingModel model)=>Column(
   crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisSize: MainAxisSize.min,
  children: [
    Expanded(
      child: CustomImage(
        imagePath: model.image,
      ),
    ),
     Text(
      model.body.tr(context)
      ,style:const TextStyle(
      fontSize: 20,
      color: Colors.blue,
      fontWeight:FontWeight.bold,
    ),
    ),
  ],
);
