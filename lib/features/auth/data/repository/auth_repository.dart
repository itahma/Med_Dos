import 'package:dartz/dartz.dart';
import 'package:med_dos/core/database/api/api_consumer.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/error/exceptions.dart';
import 'package:med_dos/features/auth/data/models/login_model.dart';

import '../../../../core/service/service_locatro.dart';

class AuthRepository{
Future<Either<String,LoginModel>>login({
  required String email,
  required String password,

})async{
  try{
    final response =await sl<ApiConsumer>().post(
      EndPoint.medSignIn,
      data: {ApiKeys.email:email,ApiKeys.password:password
      },
    );
    return Right(LoginModel.fromJson(response));
  }on ServerException catch(error){
    return left(error.errorModel.errorMessage);
  }
}
}