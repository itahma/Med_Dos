import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:med_dos/core/database/api/api_consumer.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/database/cache/cache_helper.dart';
import 'package:med_dos/core/error/exceptions.dart';
import 'package:med_dos/core/service/service_locatro.dart';
import 'package:med_dos/features/articles/data/model/ArticlesModel.dart';
import 'package:http/http.dart' as http;
import 'package:med_dos/features/myConsultations/data/model/Consultation.dart';
import 'package:path/path.dart' as path;

class ConsulationRepository {
  Future<Either<String, String>> createConsulation(
      String id, String message, String? image, String? pdf) async {
    String token = await sl<CacheHelper>().getData(key: "x-jwt");
    try {
      var request = http.MultipartRequest('POST',
          Uri.parse(EndPoint.baseUrl + EndPoint.createConnunction + "/$id"));
      if (image != "") {
        request.files.add(await http.MultipartFile.fromPath(
          'image',
          image!,
          filename: path.basename(image!),
        ));
      }

      if (pdf != "") {
        request.files.add(await http.MultipartFile.fromPath(
          'pdf',
          pdf!,
          filename: path.basename(pdf!),
        ));
      }
      if (message != null) {
        request.fields.addAll({"message": message});
      }
      request.headers.addAll({"x-jwt": token});

      var res = await request.send();

      var responseData = await http.Response.fromStream(res);
      var jsonResponse = jsonDecode(responseData.body);
        print(jsonResponse);
      return Right("Send successfuly");
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }
  Future<Either<String,List >> getMyConsulation() async {
    String token=  await sl<CacheHelper>().getData(key: "x-jwt");
    try {
      var  response=await sl<ApiConsumer>().get(EndPoint.getAllConnunction,token: token);
      List res=response.map((e)=>Consultations.fromJson(e)).toList();

      return Right(res);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }

}
