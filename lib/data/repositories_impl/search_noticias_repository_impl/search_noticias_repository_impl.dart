import 'package:news_api/domain/entitites/noticias_state/noticias_state.dart';

import '../../../domain/datasources/datasources.dart';
import '../../../domain/reepositories/search_noticias_repostory/search_noticias_repository.dart';

class SearchNoticiasRepositoryImpl implements SearchNoticiasRepository {
  final SearchNoticiasDataSource _searchNoticiasDataSource;
  SearchNoticiasRepositoryImpl(this._searchNoticiasDataSource);

  @override
  Future<NoticiasAndErrors> searchNoticias({required String query}) {
    return _searchNoticiasDataSource.searchNoticasdb(query: query);
  }
}
