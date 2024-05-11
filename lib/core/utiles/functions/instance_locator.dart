import 'package:books_app/core/utiles/api_services.dart';
import 'package:books_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:books_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:books_app/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final gitIt = GetIt.instance;
void instanceLocator() {
  gitIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  gitIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDatasourceImpl(),
      homeRemoteDataSource:
          HomeRemoteDataSourceImpl(apiServices: gitIt.get<ApiServices>()),
    ),
  );
}
