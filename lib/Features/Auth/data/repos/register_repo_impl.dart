import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/Core/errors/failures.dart';
import 'package:todo_app/Core/utils/api_services.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Features/Auth/data/models/register_request_model.dart';
import 'package:todo_app/Features/Auth/data/repos/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final ApiService _apiService;

  RegisterRepoImpl({required ApiService apiService}) : _apiService = apiService;

  @override
  Future<Either<Failures, void>> register(RegisterRequestModel model) async {
    try {
      Response response = await _apiService.post(
        endPoint: EndPoints.register,
        body: model.toJson(),
      );
      log(response.data.toString());
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(dioException: e));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
