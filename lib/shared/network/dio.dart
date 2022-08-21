import 'package:dio/dio.dart';
class DioHelper {
  static late Dio dio;
  static init() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://newsapi.org/',
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }
 // return in future list of maps
  static Future<List<dynamic>> getData(
      {required Map<String, dynamic> query}) async {
    try {
      Response response =
      await dio.get('v2/top-headlines', queryParameters: query);
      return response.data['articles'];
    } catch (e) {
      throw(e.toString());
    }
  }
  static Future<List<dynamic>> getSearchData(
    {required Map<String,dynamic> query}
  ) async{
  try { Response response = await  dio.get('v2/everything' ,queryParameters: query);
    return response.data['articles'];
    } catch(e){
      throw(e.toString());
    }
  }
  // Future <Response> getData(
  //   {
  //     required String url,
  //     required Map<String, dynamic>query,
  //   }
  // )async{
  //   return await dio.get(url, queryParameters: query);
  // }
}