import 'package:injectable/injectable.dart';
import 'package:route_task/data/repos/home_repos/data_sources/home_online_ds_impl.dart';
import 'package:route_task/data/repos/home_repos/home_repo_impl.dart';
import 'package:route_task/domain/repos/home_repo/data_source/home_online_ds.dart';
import 'package:route_task/domain/repos/home_repo/home_repo.dart';

@module
abstract class AppModule {
  @lazySingleton
  HomeOnlineDs homeOnlineDsImpl() => HomeOnlineDsImpl();

  @lazySingleton
  HomeRepo homeRepoImpl(HomeOnlineDs homeOnlineDs) => HomeRepoImpl(homeOnlineDs);
}
