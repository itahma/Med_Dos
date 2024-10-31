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
import 'package:med_dos/features/myConsultations/chat/data/model/message.dart';
import 'package:med_dos/features/myConsultations/data/model/Consultation.dart';
import 'package:path/path.dart' as path;

class MessagesRepository {
  Future<Either<String, List>> getMessages(id) async {
    String token = await sl<CacheHelper>().getData(key: "x-jwt");
    try {
      var response = await sl<ApiConsumer>()
          .get(EndPoint.getMessageConnunction + "/$id", token: token);
      List res = response.map((e) => Message.fromJson(e)).toList();
      res = res.reversed.toList();
      return Right(res);
    } on ServerException catch (error) {
      return left(error.errorModel.errorMessage);
    }
  }
}
