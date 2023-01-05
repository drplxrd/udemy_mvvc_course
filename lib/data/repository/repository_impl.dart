import 'package:udemy_mvvc_course/data/data_source/remote_data_source.dart';
import 'package:udemy_mvvc_course/data/network/network_info.dart';
import 'package:udemy_mvvc_course/domain/model.dart';
import 'package:udemy_mvvc_course/data/request/request.dart';
import 'package:udemy_mvvc_course/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:udemy_mvvc_course/domain/repository.dart';
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
      final response = await _remoteDataSource.login(loginRequest);
      if (response.status == 0) {
        //return data
        //return right

        return Right(response.toDomain());
      } else {
//return error
        return Left(Failure(409, response.message ?? "Connection error"));
      }
    } else {
      return Left(Failure(409, "Please check your internet connection"));
    }
  }
}
