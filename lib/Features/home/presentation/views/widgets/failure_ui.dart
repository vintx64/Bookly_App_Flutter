import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly/core/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/utils/styles.dart';

class FailureUi extends StatelessWidget {
  const FailureUi({
    super.key,
    required this.errMessage,
  });
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset('assets/lotties/error.json',
              width: MediaQuery.of(context).size.width * 0.6),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              errMessage,
              textAlign: TextAlign.center,
              style: Styles.textStyly14,
            ),
          ),
          const SizedBox(
            height: 32.0,
          ),
          CustomBtn(
            onPressed: () => reloadHomeViewData(context),
            textBtn: 'try again',
            textColor: Colors.black.withOpacity(.7),
            backgroundColor: const Color(0xffEF8262),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  void reloadHomeViewData(BuildContext context) {
    BlocProvider.of<NewsetBooksCubit>(context).fetchNewsetBooks();
    BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturdBooks();
  }
}
