import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/domain/usecases/get_all_product_use_case.dart';

@injectable
class HomeViewModel extends Cubit<HomeViewModelState>{
  GetAllProductUseCase getAllProductUseCase;
  HomeViewModel(this.getAllProductUseCase): super(HomeViewModelInitial());

  void loadAllAssessment(){
    getAllProductUseCase.execute();
  }


}


abstract class HomeViewModelState {}

class HomeViewModelInitial extends HomeViewModelState {}

class HomeViewModelLoading extends HomeViewModelState {}

class HomeViewModelFailure extends HomeViewModelState {
  final String error;

  HomeViewModelFailure({required this.error});
}

class HomeViewModelSuccess extends HomeViewModelState {
  /*final List<GetAllInvoicesResponse> response;

  GetAllInvoicesSuccess({
    required this.response,
  });*/
}
