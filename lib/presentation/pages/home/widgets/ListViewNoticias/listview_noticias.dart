import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_api/domain/entitites/entitites.dart';
import 'package:news_api/presentation/pages/home/widgets/widgets_home.dart';

import '../../../../providers/home/home_provider_impl.dart';
import '../../../pages.dart';

class ListViewNoticias extends ConsumerStatefulWidget {
  const ListViewNoticias({super.key});

  @override
  ListViewNoticiasState createState() => ListViewNoticiasState();
}

class ListViewNoticiasState extends ConsumerState<ListViewNoticias> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    ref.read(getNoticiasNovedades.notifier).getNoticias();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels + 200 >=
          _scrollController.position.maxScrollExtent) {
        ref.read(getNoticiasNovedades.notifier).getNoticias();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final NoticiasAndErrors searchState = ref.watch(searchNoticias);
    final NoticiasAndErrors noticiasState = ref.watch(getNoticiasNovedades);
    final Size size = MediaQuery.of(context).size;

    if (noticiasState.noticias == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (noticiasState.errorMessage == 'No hay mas noticias') {
      SchedulerBinding.instance.addPostFrameCallback(
        (_) {
          SnackBar snackBar =
              SnackBar(content: Text(noticiasState.errorMessage!));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          ref.read(getNoticiasNovedades.notifier).setLimpiarErrorMessage();
        },
      );
    }
    if (searchState.noticias != null) {
      if (searchState.noticias!.isEmpty) {
        SchedulerBinding.instance.addPostFrameCallback(
          (_) {
            SnackBar snackBar =
                const SnackBar(content: Text('No se encontraron noticias'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        );
      }
    }

    return Expanded(
      child: ListView.separated(
        itemCount: (searchState.noticias == null)
            ? noticiasState.noticias!.length
            : searchState.noticias!.length,
        // itemCount: noticiasState.noticias!.length,
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        padding: EdgeInsets.zero,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          late List<Noticia> noticias;
          if (searchState.noticias == null) {
            noticias = noticiasState.noticias!;
          } else {
            noticias = searchState.noticias!;
          }
          return SizedBox(
            height: size.height * 0.35,
            child: Material(
              child: InkWell(
                onTap: () {
                  context.push(
                    DetallesNotixiaPage.routerName,
                    extra: noticias[index],
                  );
                },
                child: Column(
                  children: [
                    EncabesadoTituloTarjeta(
                      titulo: noticias[index].title,
                    ),
                    ImagenTarjeta(
                      urlImagen: noticias[index].urlToImage,
                    ),
                    DetallesTarjeta(
                      source: noticias[index].source,
                      autor: noticias[index].author,
                      fecha: noticias[index].publishedAt,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
