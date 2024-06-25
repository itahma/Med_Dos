import 'package:dartz/dartz.dart';
import 'package:med_dos/core/database/api/api_consumer.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/error/exceptions.dart';
import 'package:med_dos/core/service/service_locatro.dart';
import 'package:med_dos/features/articles/data/model/ArticlesModel.dart';
class ArticlesRepository{
  Future<Either<String,List<ArticlesModel> >> getAllArticles() async {
    try {
      final response = await sl<ApiConsumer>().get(EndPoint.getAllSpecialist);
      List<ArticlesModel> res=response.map((e)=>ArticlesModel.fromJson(e)).toList();
      return Right(res);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }
}