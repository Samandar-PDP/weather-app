import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/weahter.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/data/2.5/weather')
  Future<WeatherResponse> getCurrentWeather(@Query('q') String query,
      [@Query('units') String units = "standart",
      @Query('appid') String key = "6592d24a33ae13c2ac1401db99732c61"]);
}
Dio buildDioClient(String baseUrl) { // build dio client
  final dio = Dio()..options = BaseOptions(baseUrl: baseUrl);
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));
  return dio;
}
