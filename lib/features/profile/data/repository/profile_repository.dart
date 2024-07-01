import 'package:dartz/dartz.dart';
import 'package:med_dos/core/database/api/api_consumer.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/database/cache/cache_helper.dart';
import 'package:med_dos/core/error/exceptions.dart';
import 'package:med_dos/core/service/service_locatro.dart';
import 'package:med_dos/features/profile/data/models/profile_model.dart';

class ProfileRepository{
  Future<Either<String,ProfileModel>> getProfile() async {
    String token=  await sl<CacheHelper>().getData(key: "x-jwt");
    try {
      var  response=await sl<ApiConsumer>().get(EndPoint.getProfile,token: token);
      var res=ProfileModel.formJson(response);

      return Right(res);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }
}