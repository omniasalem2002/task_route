import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/data/models/ProductDM.dart';
import 'package:route_task/data/models/failure.dart';
import 'package:route_task/domain/repos/home_repo/home_repo.dart';

@injectable
class GetAllProductUseCase extends Cubit<GetAllProductState> {
  final HomeRepo homeRepo;

  GetAllProductUseCase(this.homeRepo) : super(GetAllProductInitial());

  Future<void> execute() async {
    emit(GetAllProductLoading());
    Either<Failure, List<Products>> either = await homeRepo.getProduct();
    either.fold(
          (failure) => emit(GetAllProductFailure(failure.errorMessage)),
          (products) => emit(GetAllProductSuccess<List<Products>>(data:products)),
    );
  }
}

abstract class GetAllProductState {}

class GetAllProductInitial extends GetAllProductState {}

class GetAllProductLoading extends GetAllProductState {}

class GetAllProductSuccess <Type> extends GetAllProductState  {
  Type? data;

  GetAllProductSuccess({this.data});
}

class GetAllProductFailure extends GetAllProductState {
  final String error;

  GetAllProductFailure(this.error);
}
