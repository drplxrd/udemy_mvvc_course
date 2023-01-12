// ignore_for_file: prefer_final_fields

import 'package:udemy_mvvc_course/data/data_source/remote_data_source.dart';
import 'package:udemy_mvvc_course/data/network/error_handler.dart';
import 'package:udemy_mvvc_course/data/network/network_info.dart';
import 'package:udemy_mvvc_course/domain/model.dart';
import 'package:udemy_mvvc_course/data/request/request.dart';
import '../../data/network/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repository.dart';
import '../mapper/mapper.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;
  RepositoryImpl(
    this._remoteDataSource,
    this._networkInfo,
  );
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          //return data
          //return right

          return Right(response.toDomain());
        } else {
          //return error
          return Left(
            Failure(
              response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (e) {
        return (Left(ErrorHandler.handler(e).failure));
      }
    } else {
      return Left(
        DataSource.NO_INTERNET_CONNECTION.getFailure(),
      );
    }
  }
}
