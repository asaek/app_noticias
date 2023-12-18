import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/datasources_impl/datasources.dart';
import '../../../data/repositories_impl/repositories_impl.dart';

// La inyeccion de dependencias es interesante por que este provider esta inyectando
// osea esta creando una instancia del provider y este se enviar a los providers
// que lo necesiten, en este caso el provider de noticias_provider.dart
final Provider<NoticiasRepositoryImpl> noticaInyeccionProvider =
    Provider((ref) {
  return NoticiasRepositoryImpl(NoticiasDataSourceImpl());
});

final Provider<SearchNoticiasRepositoryImpl> searchInyeccionProvider =
    Provider((ref) {
  return SearchNoticiasRepositoryImpl(SearchNoticiasDatasourceImpl());
});
