import 'package:dartz/dartz.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/features/home_menu/presintion/screen/radiologe_center/data/model/radiologeModel.dart';

import '../../../../../../../core/database/api/api_consumer.dart';
import '../../../../../../../core/database/cache/cache_helper.dart';
import '../../../../../../../core/error/exceptions.dart';
import '../../../../../../../core/service/service_locatro.dart';

class RadioCenterRepository{
  Future<Either<String,List >> getAllRadioCenter() async {
    String token=  await sl<CacheHelper>().getData(key: "x-jwt");
    try {
      var  response=await sl<ApiConsumer>().get(EndPoint.getAllRadioCenter,token: token);
      List res=response.map((e)=>RadiologyModel.fromJson(e)).toList();
      return Right(res);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }
}