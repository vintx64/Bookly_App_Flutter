import 'package:bookly/Features/Search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly/Features/Search/presentation/views/search_view.dart';
import 'package:bookly/Features/home/data/models/bookly_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Search/data/repos/search_repo_impl.dart';
import '../../Features/Splash/presentation/views/splash_view.dart';
import '../../Features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(
            searchRepo: getIt.get<SearchRepoImpl>(),
          ),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
