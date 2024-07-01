import 'package:dartz/dartz.dart';
import 'package:med_dos/core/database/api/api_consumer.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/database/cache/cache_helper.dart';
import 'package:med_dos/core/error/exceptions.dart';
import 'package:med_dos/core/service/service_locatro.dart';
import 'package:med_dos/features/articles/data/model/ArticlesModel.dart';
class ArticlesRepository{
  Future<Either<String,List >> getAllArticles() async {
  String token=  await sl<CacheHelper>().getData(key: "x-jwt");
    try {
    var  response=await sl<ApiConsumer>().get(EndPoint.getAllArticle,token: token);
       List res=response.map((e)=>ArticlesModel.fromJson(e)).toList();

      return Right(res);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }
}