import 'package:bookly/Features/Search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key});
  final InputBorder border = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(12),
  );
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      onChanged: (bookName) {
        BlocProvider.of<SearchCubit>(context)
            .fetchSearchedBooks(bookName: bookName);
      },
      decoration: InputDecoration(
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          hintText: 'Search',
          suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 24,
              ))),
    );
  }
}
