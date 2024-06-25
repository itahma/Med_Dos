import 'package:dartz/dartz.dart';
import 'package:med_dos/core/database/api/api_consumer.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/error/exceptions.dart';
import 'package:med_dos/core/service/service_locatro.dart';
import 'package:med_dos/features/home/data/models/Specialist_model.dart';
class HomeRepository {
  Future<Either<String,List<SpecialistModel> >> getAllSpecialist() async {
    try {
      final response = await sl<ApiConsumer>().get(EndPoint.getAllSpecialist,);
      List<SpecialistModel> res=response.map((e)=>SpecialistModel.fromJson(e)).toList();
      return Right(res);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }
//
//   Future<Either<String, RegisterModel>> register({
//     required String firstName,
//     required String lastName,
//     required String phone,
//     required String email,
//     required String password,
//     //required String confirmPassword,
//     required String date,
//     required String code,
//     required String gender,
//
//   }) async {
//     try {
//       final response = await sl<ApiConsumer>().post(
//         EndPoint.medSignUp,
//         data: {
//
//           ApiKeys.email: email,
//           ApiKeys.dataBirth: date,
//           ApiKeys.password: password,
//           //ApiKeys.confirmPassword:confirmPassword,
//           ApiKeys.firstName: firstName,
//           ApiKeys.lastName: lastName,
//           ApiKeys.phone: phone,
//           ApiKeys.code: code,
//           ApiKeys.gender: gender,
//
//
//         },
//       );
//
//       return Right(RegisterModel.fromJson(response));
//     } on ServerException catch (error) {
//       return left(error.errorModel.errorMessage);
//     }
//   }
//
//   Future<Either<String, String>> sendCode(String email,) async {
//     try {
//       final response = await sl<ApiConsumer>().post(
//         EndPoint.sendCode,
//         data: {ApiKeys.email: email,
//         },
//       );
//
//       return Right("hhygtfr");
//     } on ServerException catch (error) {
//       return Left(error.errorModel.errorMessage);
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }
//
//   Future<Either<String, String>> registerSendCode(String email,) async {
//     try {
//       final response = await sl<ApiConsumer>().post(
//
//         EndPoint.registerSendCode,
//         data: {ApiKeys.email: email,
//         },
//       );
//
//       return Right(response.data["message"]);
//     } on ServerException catch (error) {
//       return Left(error.errorModel.errorMessage);
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }
//
// //restPassword
//
//   Future<Either<String, String>> resetPassword({
//     required String email,
//     required String password,
//     required String code,
//
//   }) async {
//     try {
//       final response = await sl<ApiConsumer>().put(
//         EndPoint.changeForgottenPassword,
//         data: {
//           ApiKeys.email: email,
//           ApiKeys.password: password,
//           ApiKeys.code: code,
//
//         },
//       );
//
//       return Right(response.toString());
//     } on ServerException catch (error) {
//       return left(error.errorModel.errorMessage);
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }
}