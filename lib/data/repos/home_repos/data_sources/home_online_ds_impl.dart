import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:route_task/data/models/ProductDM.dart';
import 'package:route_task/data/models/failure.dart';
import 'package:route_task/domain/repos/home_repo/data_source/home_online_ds.dart';
import 'package:route_task/ui/utils/end_points.dart';

@injectable
class HomeOnlineDsImpl extends HomeOnlineDs {
  final http.Client _client = http.Client();

  Future<Either<Failure, List<Products>>> getProduct() async {
    try {
      Uri url = Uri.https(EndPoints.baseUrl, EndPoints.assessment);
      http.Response serverResponse = await _client.get(url);

      if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
        ProductDm myResponse =
        ProductDm.fromJson(jsonDecode(serverResponse.body));
        return Right(myResponse.products ?? []);
      } else {
        return Left(Failure("Failed to load"));
      }
    } catch (error, stackTrace) {
      print("MainOnlineDSImpl-getCategories: $error, $stackTrace");
      return Left(Failure(error.toString()));
    }
  }

  void dispose() {
    _client.close();
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    HttpClient client = super.createHttpClient(context);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  }
}
