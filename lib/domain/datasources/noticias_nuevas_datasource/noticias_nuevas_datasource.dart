import '../../entitites/entitites.dart';

abstract class NoticiasDataSource {
  Future<NoticiasAndErrors> getNoticias({int page});
}
