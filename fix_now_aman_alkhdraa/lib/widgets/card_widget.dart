import 'package:fix_now_aman_alkhdraa/repos/favorite_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/services_model.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.cardHeight,
    required this.cardWidth,
    required this.list,
    // required this.heroTag,
  });

  final double cardHeight;
  final double cardWidth;
  final List<ServicesModel> list;
  // final  String heroTag;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18+cardHeight.h,
      width: cardWidth.w,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color(0xffBDC9C9)),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12.r),
            child: Hero(
              tag: 'service image ${list[1].id}',
              child: Container(
                height: 192.h,
                width: cardWidth,
                alignment: .topRight,
                decoration: BoxDecoration(
                 //!!!!!!!!!!!!!!!!!!!!!!!!!!
                  // image: DecorationImage(
                  //   image: NetworkImage(list[1].image) ?? AssetImage('assets/image/logo.png'),
                  //   fit: .fill,
                  // ),
                ),
                child: IconButton(onPressed: () {
                  
                }, icon: Icon(Icons.favorite)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Wrap(
                Row(
                  // mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      list[1].name!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.star),
                        Text(
                          list[1].rating.toString(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  list[1].description!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      '\$${list[1].price}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 32.h,
                      width: 100.w,
                      child: FilledButton(onPressed: () {}, child: Text('book'))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
