import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/views/details_view.dart';
import 'package:flutter/material.dart';

import '../models/services_model.dart';
import '../widgets/card_widget.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.widthOf(context);
    double screenHeight = MediaQuery.heightOf(context);
    List<ServicesModel> list = [
      ServicesModel(
        name: 'name',
        rating: 5.0,
        description:
            'Comprehensive home deep cleaning service including all rooms and appliances.',
        price: 110,
        image: 'image',
        id: 1,
      ),
      ServicesModel(
        name: 'name',
        rating: 5.0,
        description:
            'Comprehensive home deep cleaning service including all rooms and appliances.',
        price: 110,
        image: 'image',
        id: 2,
      ),
      ServicesModel(
        name: 'name',
        rating: 5.0,
        description:
            'Comprehensive home deep cleaning service including all rooms and appliances.',
        price: 110,
        image: 'image',
        id: 3,
      ),
    ];
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
            Expanded(
              child: ListView.separated(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailsView()),
                      );
                    },
                    child: CardWidget(
                      cardHeight: 358.h,
                      list: list,
                      cardWidth: screenWidth.w,
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 16.h);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
