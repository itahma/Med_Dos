import 'package:flutter/material.dart';
import 'package:med_dos/core/utils/app_assets.dart';
import 'package:med_dos/core/utils/widget/customimage.dart';

class OnBoarding1Screen extends StatelessWidget {
  const OnBoarding1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 140),
              child: CustomImage(
                  imagePath: AppAssets.Onboarding1,
                w: 340,
                h: 302,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                maxLines: 2,
                "معنا ستكون على إطلاع دائم عن كل ما هو جديد في عالم الطب"
              ,style:TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight:FontWeight.bold,
              ),
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){},
                child: Text("التالي")),
          ],
        ),

      ),
    );
  }
}
