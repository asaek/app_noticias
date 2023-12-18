import '../../entitites/entitites.dart';

abstract class NoticiasRepository {
  Future<NoticiasAndErrors> getNoticias({int page});
}
