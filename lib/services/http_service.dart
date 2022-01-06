import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:moviefy/models/app_config.dart';

class HTTPService {
  //This class will be responsible for handling the logic of sending requests
  final Dio dio = Dio();
  final GetIt getIt = GetIt.instance;

  String? _base_url;
  String? _api_key;

  HTTPService() {
    AppConfig _config = getIt.get<AppConfig>();
    _base_url = _config.BASE_API_URL;
    _api_key = _config.API_KEY;
  }

  Future get(String _path, {required Map<String, dynamic> query}) async {
    try {
      String _url = "$_base_url$_path";
      Map<String, dynamic> _query = {"api_key": _api_key, "language": "en-US"};
      if (query != null) {
        _query.addAll(query);
      }
      return await dio.get(_url, queryParameters: _query);
    } on DioError catch (e) {
      print('Unable to perform get request');
      print("DioErro: $e");
    }
  }
}
