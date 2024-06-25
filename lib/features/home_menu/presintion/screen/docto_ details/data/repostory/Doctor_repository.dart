import 'package:med_dos/core/database/api/api_consumer.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/database/cache/cache_helper.dart';
import 'package:med_dos/core/error/exceptions.dart';
import 'package:med_dos/core/service/service_locatro.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/model/doctor_model.dart';
import 'package:dartz/dartz.dart';

class DoctorRepository {
  Future<Either<String, List<DoctorModel>>> getDoctorInSpecialist(id) async {
    try {
      final response = await sl<ApiConsumer>().get(
        "${EndPoint.getDoctorInSpecialist}/$id",
      );
      List<DoctorModel> res = response.map((e) => DoctorModel.fromJson(e)).toList();
      return Right(res);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> bookAppointment(
      int doctorID, String date) async {
    //String token=await sl<CacheHelper>().getData(key: ApiKeys.token,);
    try {
      final response = await sl<ApiConsumer>().post(EndPoint.bookAppointment,
          data: {"doctor_id": doctorID, "date": date});
      return Right(response.toString());
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }
}
