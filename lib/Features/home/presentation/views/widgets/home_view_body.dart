import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'best_seller_list_view_item.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const FeaturedBooksListView(),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Best Seller',
            style: Styles.textStyly18.copyWith(fontFamily: 'Montserrat'),
          ),
          const SizedBox(
            height: 20,
          ),
          const BestSellerListViewItem(),
        ],
      ),
    );
  }
}
