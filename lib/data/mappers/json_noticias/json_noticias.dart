import '../../../domain/entitites/entitites.dart';
import '../../models/models.dart';
import '../mappers.dart';

List<Noticia> JsonToNoticias(List<dynamic> json) {
  final List<NoticiaModel> noticiasModel = [];
  for (final dynamic noticia in json) {
    noticiasModel.add(NoticiaModel.fromJson(noticia));
  }
  return noticiasModel.map((e) => NoticiaMapper.noticiaDBToEntitie(e)).toList();
}
