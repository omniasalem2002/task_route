import 'package:dartz/dartz.dart';
import 'package:route_task/data/models/ProductDM.dart';
import 'package:route_task/data/models/failure.dart';

abstract class HomeOnlineDs{
  Future<Either<Failure,List<Products>>> getProduct();
}