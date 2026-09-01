import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/views/details_view.dart';
import 'package:flutter/material.dart';

import '../models/services_model.dart';
import '../widgets/card_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
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
      appBar: AppBar(title: Text('FixNow')),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            //!======================================================
            //  SearchAnchor.bar(suggestionsBuilder: (BuildContext context, SearchController controller) {
            //   final String input=controller.value.text;
              
            //   return list.where((ServicesModel item){list[0].name.contains(input).map((ServicesModel filterdService){})});
              
            //  },),
            //!======================================================

            // TextFormField(
            //   decoration: InputDecoration(
            //     prefixIcon: Icon(
            //       Icons.search,
            //       color: Color(0xffBDC9C9),
            //       size: 24,
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Color(0xffBDC9C9)),
            //       borderRadius: BorderRadius.circular(4),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Color(0xffBDC9C9)),
            //       borderRadius: BorderRadius.circular(4),
            //     ),
            //     disabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Color(0xffBDC9C9)),
            //       borderRadius: BorderRadius.circular(4),
            //     ),
            //     errorBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Color(0xffBDC9C9)),
            //       borderRadius: BorderRadius.circular(4),
            //     ),
            //   ),
            // ),
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
