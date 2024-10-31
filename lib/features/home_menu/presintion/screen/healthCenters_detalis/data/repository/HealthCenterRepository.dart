import 'package:med_dos/core/database/api/api_consumer.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/error/exceptions.dart';
import 'package:med_dos/core/service/service_locatro.dart';
import 'package:med_dos/features/home_menu/presintion/screen/healthCenters_detalis/data/Model/HealthCenterModel.dart';
import 'package:dartz/dartz.dart';
import 'package:med_dos/features/home_menu/presintion/screen/healthCenters_detalis/data/Model/doctor_center.dart';
class HealthCenterRepository{
  Future<Either<String,List>> getAllHealthCenter() async {
    try {
      final response = await sl<ApiConsumer>().get(EndPoint.getAllHealthCenter,);
      List res=response.map((e)=>HealthCenterModel.fromJson(e)).toList();
      return Right(res);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }
  Future<Either<String, List>> getDoctorInCenter(String specialist,id) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoint.getDoctorInHealthCenter+"/$id",
        data: { "jurisdictionName":specialist},
      );
      var res = response.data.map((e) => DoctorCenterModel.fromJson(e)).toList();
      return Right(res);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }

}