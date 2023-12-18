import 'package:dio/dio.dart';
import 'package:news_api/config/constants/environments.dart';

import '../../../domain/datasources/datasources.dart';
import '../../../domain/entitites/entitites.dart';
import '../../mappers/json_noticias/json_noticias.dart';

class NoticiasDataSourceImpl extends NoticiasDataSource {
  //

  @override
  Future<NoticiasAndErrors> getNoticias({int page = 1}) async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/v2',
        queryParameters: {
          'apiKey': Environments.newsApiKey,
          'country': 'us',
          'pageSize': 10,
          'page': page,
        },
      ),
    );
    final Response<dynamic> response = await dio.get('/top-headlines');

    try {
      if (response.statusCode == 200 && response.data != null) {
        return NoticiasAndErrors(
          noticias: JsonToNoticias(response.data['articles']),
        );
      } else {
        return NoticiasAndErrors(
          errorMessage: 'Error al obtener las noticias de Internet',
        );
      }
    } catch (e) {
      return NoticiasAndErrors(errorMessage: e.toString());
    }
  }
}
