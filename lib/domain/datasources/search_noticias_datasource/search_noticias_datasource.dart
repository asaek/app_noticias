import '../../entitites/entitites.dart';

abstract class SearchNoticiasDataSource {
  Future<NoticiasAndErrors> searchNoticasdb({required String query});
}
