import 'package:bookly/Features/Search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly/Features/Search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/models/bookly_model/book_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchViewBody(),
    );
  }
}
