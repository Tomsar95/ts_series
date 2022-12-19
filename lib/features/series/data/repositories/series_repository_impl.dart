import 'package:dartz/dartz.dart';
import 'package:tv_series/features/core/error/exceptions.dart';
import 'package:tv_series/features/core/error/failures.dart';
import 'package:tv_series/features/series/data/datasources/series_remote_data_source.dart';
import 'package:tv_series/features/series/domain/entities/series.dart';
import 'package:tv_series/features/series/domain/repositories/series_repository.dart';

class SeriesRepositoryImpl implements SeriesRepository {
  final SeriesRemoteDataSource remoteDataSource;

  SeriesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Series>>> getPopularSeries() async {
    try {
      final seriesList = await remoteDataSource.getPopularSeries();
      return Right(seriesList);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getRecommendedSeries() async {
    try {
      final seriesList = await remoteDataSource.getPopularSeries();
      return Right(seriesList);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getAiringSeries() async {
    try {
      final seriesList = await remoteDataSource.getAiringSeries();
      return Right(seriesList);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Series>> getSeriesDetails(int seriesId) async {
    try {
      final seriesDetails = await remoteDataSource.getSeriesDetails(seriesId);
      return Right(seriesDetails);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}