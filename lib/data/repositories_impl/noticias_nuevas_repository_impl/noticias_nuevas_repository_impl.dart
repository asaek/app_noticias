import 'package:news_api/domain/entitites/noticias_state/noticias_state.dart';

import '../../../domain/datasources/datasources.dart';
import '../../../domain/reepositories/repositories.dart';

class NoticiasRepositoryImpl implements NoticiasRepository {
  final NoticiasDataSource _noticiasDataSource;
  NoticiasRepositoryImpl(this._noticiasDataSource);

  @override
  Future<NoticiasAndErrors> getNoticias({int page = 1}) {
    return _noticiasDataSource.getNoticias(page: page);
  }
}
