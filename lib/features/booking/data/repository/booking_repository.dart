import 'package:dartz/dartz.dart';
import 'package:med_dos/features/booking/data/Model/booking.dart';

import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/end_points.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/service/service_locatro.dart';

class BookingRepository{
  Future<Either<String,List >> getMyBooking() async {
    String token=  await sl<CacheHelper>().getData(key: "x-jwt");
    try {
      var  response=await sl<ApiConsumer>().get(EndPoint.showMybockings,token: token);
      List res=response.map((e)=>Booking.fromJson(e)).toList();

      return Right(res);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }
  Future<Either<String,String >> cancelBooking(id) async {
    String token=  await sl<CacheHelper>().getData(key: "x-jwt");
    try {
      var  response=await sl<ApiConsumer>().post(EndPoint.cancelbocking+"/$id",token: token);
      print(response.data);

      return Right(response.data);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }
}