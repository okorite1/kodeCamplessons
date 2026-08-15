import 'package:dio/dio.dart';
import 'package:taskfive/services/networks/network_interceptor.dart';

class ApiService {
  late final Dio dio;

  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://dummyjson.com',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(NetworkInterceptor());
  }

  Future<List<dynamic>> fetchRecipes() async {
    final response = await dio.get('/recipes');

    return response.data['recipes'];
  }
}
