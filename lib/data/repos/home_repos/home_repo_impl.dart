import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/data/models/ProductDM.dart';
import 'package:route_task/data/models/failure.dart';
import 'package:route_task/domain/repos/home_repo/data_source/home_online_ds.dart';
import 'package:route_task/domain/repos/home_repo/home_repo.dart';

@injectable
class HomeRepoImpl extends HomeRepo {
  final HomeOnlineDs homeOnlineDs;

  HomeRepoImpl(this.homeOnlineDs);

  @override
  Future<Either<Failure, List<Products>>> getProduct() async {
    try {
      final result = await homeOnlineDs.getProduct();
      return result.fold(
            (failure) {
          // Handle or log the failure as needed
          print('Error: ${failure.toString()}');
          return Left(failure);
        },
            (assessments) {
          // Any additional processing of assessments can be done here
          return Right(assessments);
        },
      );
    } catch (e) {
      // Handle unexpected errors
      print('Unexpected error: ${e.toString()}');
      return Left(Failure('Unexpected error occurred'));
    }
  }
}
