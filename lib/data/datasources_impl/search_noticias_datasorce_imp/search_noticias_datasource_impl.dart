import 'package:dio/dio.dart';
import 'package:news_api/domain/entitites/noticias_state/noticias_state.dart';

import '../../../domain/datasources/datasources.dart';
import '../../mappers/json_noticias/json_noticias.dart';

class SearchNoticiasDatasourceImpl implements SearchNoticiasDataSource {
  @override
  Future<NoticiasAndErrors> searchNoticasdb({required String query}) async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/v2',
        queryParameters: {
          'apiKey': '6ff70169fbe54cc687efb6f777b7c6e9',
          'q': query,
          'sortBy': 'popularity',
        },
      ),
    );
    try {
      final Response<dynamic> response = await dio.get('/everything');
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
      return NoticiasAndErrors(
        errorMessage: 'Error al procesar las noticias',
      );
    }
  }
}
