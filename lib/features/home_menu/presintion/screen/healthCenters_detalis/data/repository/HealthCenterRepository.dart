import 'package:med_dos/core/database/api/api_consumer.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/error/exceptions.dart';
import 'package:med_dos/core/service/service_locatro.dart';
import 'package:med_dos/features/home_menu/presintion/screen/healthCenters_detalis/data/Model/HealthCenterModel.dart';
import 'package:dartz/dartz.dart';
class HealthCenterRepository{
  Future<Either<String,List<HealthCenterModel> >> getAllHealthCenter() async {
    try {
      final response = await sl<ApiConsumer>().get(EndPoint.getAllHealthCenter,);
      List<HealthCenterModel> res=response.map((e)=>HealthCenterModel.fromJson(e)).toList();
      return Right(res);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }
}