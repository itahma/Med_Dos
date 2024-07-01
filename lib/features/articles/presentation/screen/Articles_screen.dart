import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/utils/app_assets.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/features/articles/data/model/ArticlesModel.dart';
import 'package:med_dos/features/articles/presentation/cubit/articles_cubit.dart';
import 'package:med_dos/features/articles/presentation/screen/articles_detials.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: ()async{
          BlocProvider.of<ArticlesCubit>(context).getAllArticles();
        },
        child: BlocConsumer<ArticlesCubit,ArticlesState>(
          listener: (_,state){
            if(state is ErrorArticles){
              showToast(message: state.error, state: ToastState.error);
            }
          },
          builder: (_,state){
            if(state is LoadingArticles){
              return Container(child: Center(child: SpinKitFadingCircle(color: AppColors.primary,),),);
            }if(state is LoadedArticles)
            {
              List ar=state.articlesModel  ;
              return Container(
              child: ListView.builder(
                padding: EdgeInsets.all(15),
                itemBuilder: (_, i) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailsArticle(articlesModel: ar[i])));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 160,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.grey, blurRadius: 15, offset: Offset(3, 2))
                      ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: ListTile(
                              leading: CircleAvatar(

                              backgroundImage: NetworkImage(

                                  ar[i].doctorProfile!=null? EndPoint.ImageUrl+ar[i].doctorProfile:"https://th.bing.com/th/id/OIP.rzvJIIoK4rs7kpN44Q5YegHaE8?rs=1&pid=ImgDetMain"),

                            ),

                              title: Text(
                                ar[i].doctorName,
                                style: TextStyle(fontSize: 14),
                              ),trailing:
                              ar[i].photo!=null?  Container(
                              height: 80,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          EndPoint.ImageUrl+ar[i].photo!
                                      ),
                                      fit: BoxFit.cover)),
                            ):Container(width: 10,),


                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              ar[i].title.toString(),
                              style: TextStyle(fontSize: 15,color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),



                        ],
                      ),
                    ),
                  );
                },
                itemCount: ar.length,
              ),
            );
          }
            return Container();
          }


        ),
      ),
    );
  }
}
