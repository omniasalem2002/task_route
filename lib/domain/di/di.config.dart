// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repos/home_repos/data_sources/home_online_ds_impl.dart'
    as _i4;
import '../../data/repos/home_repos/home_repo_impl.dart' as _i6;
import '../../ui/screens/home/home_view_model.dart' as _i8;
import '../repos/home_repo/data_source/home_online_ds.dart' as _i3;
import '../repos/home_repo/home_repo.dart' as _i5;
import '../usecases/get_all_product_use_case.dart' as _i7;
import 'app_module.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.HomeOnlineDs>(() => appModule.homeOnlineDsImpl());
    gh.factory<_i4.HomeOnlineDsImpl>(() => _i4.HomeOnlineDsImpl());
    gh.lazySingleton<_i5.HomeRepo>(
        () => appModule.homeRepoImpl(get<_i3.HomeOnlineDs>()));
    gh.factory<_i6.HomeRepoImpl>(
        () => _i6.HomeRepoImpl(get<_i3.HomeOnlineDs>()));
    gh.factory<_i7.GetAllProductUseCase>(
        () => _i7.GetAllProductUseCase(get<_i5.HomeRepo>()));
    gh.factory<_i8.HomeViewModel>(
        () => _i8.HomeViewModel(get<_i7.GetAllProductUseCase>()));
    return this;
  }
}

class _$AppModule extends _i9.AppModule {}
