import 'package:go_router/go_router.dart';

import '../../domain/entitites/entitites.dart';
import '../../presentation/pages/pages.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: HomePage.routerName,
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
        name: DetallesNotixiaPage.routerName,
        path: '/noticia_detalles',
        builder: (context, state) {
          final Noticia noticia = state.extra as Noticia;

          return DetallesNotixiaPage(noticia: noticia);
        }),
  ],
);
