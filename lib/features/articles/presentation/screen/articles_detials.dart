import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/utils/app_assets.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/app_string.dart';
import 'package:med_dos/core/widget/customimage.dart';
import 'package:med_dos/features/articles/data/model/ArticlesModel.dart';

class DetailsArticle extends StatelessWidget {
  ArticlesModel articlesModel;

  DetailsArticle({Key? key, required this.articlesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppString.medDose),
        ),
        body: Padding(
          padding: EdgeInsets.all(6),
          child: SingleChildScrollView(
            child: Column(
              children: [
                articlesModel.photo != null
                    ? Image.network(EndPoint.ImageUrl + articlesModel.photo!)
                    : Container(),
                SizedBox(
                  height: 24,
                ),

                Container(padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:
                  Row(
                    children: [
                      CircleAvatar(backgroundImage: NetworkImage(articlesModel.doctorProfile != null
                          ?EndPoint.ImageUrl + articlesModel.photo!:"https://th.bing.com/th/id/OIP.rzvJIIoK4rs7kpN44Q5YegHaE8?rs=1&pid=ImgDetMain"),)
                  ,SizedBox(width: 10,),

                      Text(
                         articlesModel.doctorName,
                        style:
                        TextStyle(color: AppColors.primary, fontSize: 18),
                      ),
                    ],
                  ),

                ), SizedBox(
                  height: 24,
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  articlesModel.title,
                  style:TextStyle(decoration: TextDecoration.underline,fontSize:23,fontWeight: FontWeight.bold)


                ),

                SizedBox(
                  height: 16,
                ),
                Container(padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    articlesModel.text,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
