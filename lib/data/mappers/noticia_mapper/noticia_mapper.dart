import 'package:news_api/data/models/models.dart';
import 'package:news_api/domain/entitites/noticia_entitie/noticia_entite.dart';

class NoticiaMapper {
  static Noticia noticiaDBToEntitie(NoticiaModel noticiaModel) => Noticia(
        source: noticiaModel.source.name,
        author: noticiaModel.author!.split(','),
        title: noticiaModel.title,
        description: noticiaModel.description,
        url: noticiaModel.url,
        urlToImage: noticiaModel.urlToImage!,
        publishedAt: noticiaModel.publishedAt,
        content: noticiaModel.content ?? 'Sin contenido',
      );
}
