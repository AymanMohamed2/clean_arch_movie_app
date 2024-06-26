import 'package:dartz/dartz.dart';
import 'package:task_2/modules/tv/domain/entities/tv_entity.dart';

import '../../../../core/errors/faliure.dart';

abstract class TvRepository {
  Future<Either<Failure, List<TvEntity>>> getOnTheAirTv();
  Future<Either<Failure, List<TvEntity>>> getPopularTv({int pageNumber = 1});
  Future<Either<Failure, List<TvEntity>>> getTopRatedTv({int pageNumber = 1});
}
