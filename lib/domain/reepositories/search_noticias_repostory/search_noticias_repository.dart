import '../../entitites/entitites.dart';

abstract class SearchNoticiasRepository {
  Future<NoticiasAndErrors> searchNoticias({required String query});
}
