import 'package:dio/dio.dart';

import '../../Model/headers.dart';
import '../../Model/urls.dart';

final class ProductListRepository {
  Future<dynamic> getProduct(Map<String, dynamic> params) async {
    final service = APIService.sharedInstance.fetchRequest(params);
    return service;
  }
}

class APIService {
  static APIService sharedInstance = APIService();
  final Dio _dio = Dio();

  APIService() {
    _dio.options = BaseOptions(
      baseUrl: urls['base']!, // Set the base URL from the 'urls' map
      headers: headers, // Set the headers
      responseType: ResponseType.json, // Default response type is JSON
    );
  }

  Future<dynamic> fetchRequest(Map<String, dynamic> params) async {
    try {
      // Print the full URL to verify it's correct
      final fullUrl = '${_dio.options.baseUrl}${urls['search']}';
      print('Making request to: $fullUrl');

      final response = await _dio.post(urls['search']!, data: params);
      // Make a GET request
      return response.data;
    } catch (e) {
      print('Error fetching data: $e');
      return null; // Handle errors (could be more detailed based on your use case)
    }
  }
}
