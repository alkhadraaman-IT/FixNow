import 'package:fix_now_aman_alkhdraa/provider/favorite_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/views/details_view.dart';
import 'package:flutter/material.dart';

import '../models/service_model.dart';
import '../widgets/card_widget.dart';

class FavoritesView extends ConsumerWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var favoriteListener = ref.watch(favoriteProvider);
    double screenWidth = MediaQuery.widthOf(context);
    double screenHeight = MediaQuery.heightOf(context);
    // List<ServiceModel> list = [
    //   ServiceModel(
    //     name: 'name',
    //     rating: 5.0,
    //     description:
    //         'Comprehensive home deep cleaning service including all rooms and appliances.',
    //     price: 110,
    //     image: 'image',
    //     id: 1,
    //   ),
    //   ServiceModel(
    //     name: 'name',
    //     rating: 5.0,
    //     description:
    //         'Comprehensive home deep cleaning service including all rooms and appliances.',
    //     price: 110,
    //     image: 'image',
    //     id: 2,
    //   ),
    //   ServiceModel(
    //     name: 'name',
    //     rating: 5.0,
    //     description:
    //         'Comprehensive home deep cleaning service including all rooms and appliances.',
    //     price: 110,
    //     image: 'image',
    //     id: 3,
    //   ),
    // ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Your Favorites',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 24.h),
            favoriteListener.when(
              data: (List<ServiceModel> data) {
                return Expanded(
                  child: ListView.separated(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsView(service: data[index]),
                            ),
                          );
                        },
                        child: CardWidget(
                          cardHeight: 358.h,
                          list: data,
                          cardWidth: screenWidth.w,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 16.h);
                    },
                  ),
                );
              },
              error: (error, stackTrace) => Center(
                child: Column(
                  children: [
                    Icon(Icons.warning_sharp, size: 40),
                    Text(
                      error.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              loading: () => Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
