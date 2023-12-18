import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_api/domain/entitites/entitites.dart';

import '../../providers/home/home_provider_impl.dart';
import 'widgets/widgets_home.dart';

class HomePage extends StatelessWidget {
  static const routerName = 'home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            //                                * este sera la busqueda
            _SearchTextField(size: size),
            SizedBox(height: size.height * 0.02),
            const ListViewNoticias(),
          ],
        ),
      ),
    );
  }
}

class _SearchTextField extends ConsumerWidget {
  const _SearchTextField({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: size.height * 0.05,
        width: double.infinity,
        // color: Colors.orange,999
        child: TextField(
          decoration: const InputDecoration(
            icon: Icon(Icons.search),
            hintText: 'Buscar',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.isEmpty) {
              ref.read(getNoticiasNovedades.notifier).getNoticias();
              ref
                  .read(searchNoticias.notifier)
                  .setSearchNoticias(NoticiasAndErrors());
            }
          },
          onSubmitted: (value) {
            ref
                .read(searchNoticias.notifier)
                .searchNoticiasFuture(query: value);
            // print(value);
          },
        ),
      ),
    );
  }
}
