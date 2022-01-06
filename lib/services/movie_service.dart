//Packages
import 'package:get_it/get_it.dart';

// Services
import 'package:moviefy/services/http_service.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;

  HTTPService? _http;
  MovieService() {
    _http = getIt.get<HTTPService>();
  }
}
