import 'package:dartz/dartz.dart';
import 'package:med_dos/core/database/cache/cache_helper.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/model/doctor_model.dart';

import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/service/service_locatro.dart';

class SearchRepository {
  Future<Either<String, List>> searchDoctor(String query, int sec) async {
    Map data = {};
    if (sec == 0) {
      data = {"specialization": query};
    }
    if (sec == 1) {
      data = {"name": query};
    }
    if (sec == 2) {
      data = {"city": query};
    }
    if (sec == 3) {
      data = {"country": query};
    }
    String token = await sl<CacheHelper>().getData(key: "x-jwt");
    try {
      var response = await sl<ApiConsumer>()
          .post(EndPoint.searchAdoctor, token: token, data: data);
      List res = response.data.map((e) => DoctorModel.fromJson(e)).toList();

      return Right(res);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }
}
