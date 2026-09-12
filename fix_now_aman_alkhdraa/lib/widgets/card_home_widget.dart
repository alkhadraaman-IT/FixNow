import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/service_model.dart';
import '../provider/favorite_provider.dart';

class CardHomeWidget extends ConsumerStatefulWidget {
  final ServiceModel data;

  const CardHomeWidget({super.key, required this.data});

  @override
  ConsumerState<CardHomeWidget> createState() => _CardHomeWidgetState();
}

class _CardHomeWidgetState extends ConsumerState<CardHomeWidget> {
  @override
  Widget build(BuildContext context) {
    ref.watch(favoriteProvider);
    return Container(
      height: 250.h,
      width: 240.w,
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
              tag: 'service image ${widget.data.id}',
              child: Container(
                height: 178.5.h,
                width: 240.w,
                alignment: .topRight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        NetworkImage(widget.data.image!) ??
                        AssetImage('assets/image/logo.png'),
                    fit: .fill,
                  ),
                ),
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Color(0xffffffff).withAlpha(90),
                  ),
                  onPressed: () {
                    ref
                        .read(favoriteProvider.notifier)
                        .toggleFavorite(service: widget.data);
                  },
                  icon:
                      ref
                          .watch(favoriteProvider.notifier)
                          .isFavoriteService(widget.data)
                      ? Icon(Icons.favorite)
                      : Icon(
                          // icon: isFavorite?Icon(Icons.favorite): Icon(
                          Icons.favorite_outline_rounded,
                          color: Colors.grey,
                        ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: .spaceBetween,
              children: [
                Wrap(
                  // mainAxisAlignment: .spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        maxLines: 2,
                        widget.data.name!,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.star),
                        Text(
                          '${widget.data.rating}(${widget.data.rating}+)',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                // Spacer(),

                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$${widget.data.price}',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          TextSpan(
                            text: '/hr',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
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
