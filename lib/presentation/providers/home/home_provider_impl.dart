import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entitites/entitites.dart';
import '../home_injeccion_dependencias/home_provider_inyeccion.dart';

final StateNotifierProvider<NoticiasProvider, NoticiasAndErrors>
    getNoticiasNovedades =
    StateNotifierProvider<NoticiasProvider, NoticiasAndErrors>((ref) {
  final noticiasRepository = ref.watch(noticaInyeccionProvider).getNoticias;

  return NoticiasProvider(getNoticiasCallback: noticiasRepository);
});

typedef NoticiasStateCallback = Future<NoticiasAndErrors> Function({int page});

class NoticiasProvider extends StateNotifier<NoticiasAndErrors> {
  NoticiasStateCallback getNoticiasCallback;
  NoticiasProvider({required this.getNoticiasCallback})
      : super(NoticiasAndErrors());

  int _currePage = 1;
  bool _isLoading = false;
  bool _isFinalPage = false;
  bool get getIsFinalPage => _isFinalPage;
  set setIsFinalPage(bool value) => _isFinalPage = value;

  void setLimpiarErrorMessage() {
    state.errorMessage = null;
    // state = NoticiasAndErrors(
    //   errorMessage: null,
    //   noticias: state.noticias,
    // );
  }

  Future<void> getNoticias({int page = 1}) async {
    if (_isFinalPage) return;
    if (_isLoading) return;
    _isLoading = true;

    late NoticiasAndErrors noticiasState;

    noticiasState = await getNoticiasCallback(page: _currePage);

    if (noticiasState.errorMessage != null &&
        noticiasState.errorMessage!.isNotEmpty) {
      state = NoticiasAndErrors(errorMessage: noticiasState.errorMessage);
    } else {
      // print(noticiasState.noticias);
      if (noticiasState.noticias!.isEmpty) {
        noticiasState = NoticiasAndErrors(
          errorMessage: 'No hay mas noticias',
          noticias: state.noticias,
        );
        state = noticiasState;
        _isFinalPage = true;
        _isLoading = false;
        return;
      }

      _currePage++;
      if (state.noticias == null) {
        state = NoticiasAndErrors(
          noticias: [
            ...noticiasState.noticias!,
          ],
        );
      } else {
        state = NoticiasAndErrors(
          noticias: [
            ...state.noticias!,
            ...noticiasState.noticias!,
          ],
        );
      }
    }
    _isLoading = false;
  }
}

// ! ------------------------- SearchNoticiasProvider -------------------------
final StateNotifierProvider<SearchNoticiasProvider, NoticiasAndErrors>
    searchNoticias =
    StateNotifierProvider<SearchNoticiasProvider, NoticiasAndErrors>(
  (ref) {
    final searchNoticiasRepositorie =
        ref.watch(searchInyeccionProvider).searchNoticias;

    return SearchNoticiasProvider(
        searchNoticiasCallback: searchNoticiasRepositorie);
  },
);

typedef SearchNoticiasCallback = Future<NoticiasAndErrors> Function(
    {required String query});

class SearchNoticiasProvider extends StateNotifier<NoticiasAndErrors> {
  SearchNoticiasCallback searchNoticiasCallback;
  SearchNoticiasProvider({required this.searchNoticiasCallback})
      : super(NoticiasAndErrors());

  void setSearchNoticias(NoticiasAndErrors dato) {
    state = dato;
  }

  Future<void> searchNoticiasFuture({required String query}) async {
    if (query.isEmpty) {
      state = NoticiasAndErrors(
        errorMessage: 'Ingrese un texto para buscar',
        noticias: state.noticias,
      );
      return;
    }

    final noticiasState = await searchNoticiasCallback(query: query);
    print(noticiasState);
    if (noticiasState.errorMessage != null &&
        noticiasState.errorMessage!.isNotEmpty) {
      state = NoticiasAndErrors(errorMessage: noticiasState.errorMessage);
    } else {
      state = NoticiasAndErrors(noticias: noticiasState.noticias);
    }
  }
}
