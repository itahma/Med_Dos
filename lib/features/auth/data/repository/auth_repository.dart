import 'package:dartz/dartz.dart';
import 'package:med_dos/core/database/api/api_consumer.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/error/exceptions.dart';
import 'package:med_dos/features/auth/data/models/login_model.dart';
import 'package:med_dos/features/auth/data/models/register_model.dart';

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
Future<Either<String,RegisterModel>>register({
  required String firstName,
  required String lastName,
  required String phone,
  required String email,
  required String password,
  required String confirmPassword,
  required String date,
  required String code,

})async{
  try{
    final response =await sl<ApiConsumer>().post(
      EndPoint.medSignUp,
      data: {ApiKeys.email:email,
        ApiKeys.dataBirth:date,
        ApiKeys.password:password,
        ApiKeys.confirmPassword:confirmPassword,
        ApiKeys.firstName:firstName,
        ApiKeys.lastName:lastName,
        ApiKeys.phone:phone,
        ApiKeys.code:code,


      },
    );
    return Right(RegisterModel.fromJson(response));
  }on ServerException catch(error){
    return left(error.errorModel.errorMessage);
  }
}

Future<Either<String,String>>sendCode(
   String email,

)async{
  try{
    final response =await sl<ApiConsumer>().post(
      EndPoint.sendCode,
      data: {ApiKeys.email:email,
      },
    );
    return Right(response[ApiKeys.message]);
  }on ServerException catch(error){
    return left(error.errorModel.errorMessage);
  }catch(e){
    return Left(e.toString());
  }
}
//restPassword

  Future<Either<String,String>>resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
    required String code,

  })async{
    try{
      final response =await sl<ApiConsumer>().patch(
        EndPoint.changeForgottenPassword,
        data: {
          ApiKeys.email:email,
          ApiKeys.password:password,
          ApiKeys.confirmPassword:confirmPassword,
          ApiKeys.code:code,

        },
      );
      return Right(response[ApiKeys.message]);
    }on ServerException catch(error){
      return left(error.errorModel.errorMessage);
    }catch(e){
      return Left(e.toString());
    }
  }

  Future<Either<String,String>>registerSend({
    required String email,
    required String password,
    required String confirmPassword,
    required String code,
    required String phone,
    required String firstName,
    required String lastName,
    required String date,

  })async {
    try {
      final response = await sl<ApiConsumer>().patch(
        EndPoint.changeForgottenPassword,
        data: {
          ApiKeys.email: email,
          ApiKeys.password: password,
          ApiKeys.confirmPassword: confirmPassword,
          ApiKeys.firstName: firstName,
          ApiKeys.lastName: lastName,
          ApiKeys.phone: phone,
          ApiKeys.dataBirth: date,

        },
      );
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }}