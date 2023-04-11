import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: kHomePadding,
                child: CustomAppBar(),
              ),
              const FeaturedBooksListView(),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: kHomePadding,
                child: Text(
                  'Best Seller',
                  style: Styles.textStyly18.copyWith(fontFamily: 'Montserrat'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: kHomePadding,
            child: BestSellerListView(),
          ),
        ),
      ],
    );
  }
}
