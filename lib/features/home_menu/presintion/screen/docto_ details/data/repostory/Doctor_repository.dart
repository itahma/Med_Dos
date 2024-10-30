import 'package:med_dos/core/database/api/api_consumer.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/error/exceptions.dart';
import 'package:med_dos/core/service/service_locatro.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/model/Slot.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/model/doctor_model.dart';
import 'package:dartz/dartz.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/data/model/soon_slot.dart';

class DoctorRepository {
  Future<Either<String, List>> getDoctorInSpecialist(String specialist) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoint.getDoctorInSpecialist,
        data: {"specialization": specialist},
      );

      var res = response.data.map((e) => DoctorModel.fromJson(e)).toList();
      return Right(res);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }


  Future<Either<String, List>> getTimeDay(String id, String date) async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoint.getTimeDay + "/$id/$date",
      );

      var res =
          response['availableSlots'].map((e) => Slot.fromJson(e)).toList();
      return Right(res);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, DoctorModel>> getDoctorInfo(String id) async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoint.getDoctorInfo + "/$id",
      );

      var res = DoctorModel.fromJson(response);
      return Right(res);
    } on ServerException catch (error) {
      print("sssssssssssssssssss");
      return left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> bookAppointment(
      String doctorID, String date, String time) async {
    //String token=await sl<CacheHelper>().getData(key: ApiKeys.token,);
    try {
      final response = await sl<ApiConsumer>().post(
          EndPoint.bookAppointment + "/$doctorID",
          data: {"doctor_id": doctorID, "date": date, "start": time});
      return Right(response.data['message'].toString());
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, SoonSlot>> getSoonAppointment(String id) async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoint.getSoonestAppointment + "/$id",
      );
      SoonSlot x = SoonSlot.fromJson(response);
      return Right(x);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }

  bookSoonAppointment(doctorID,String date,start) async {
    //String token=await sl<CacheHelper>().getData(key: ApiKeys.token,);
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoint.bookAppointment + "/$doctorID",
          data: {  "date": date, "start": start}
      );
      return Right(response.data['message'].toString());
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }
}
