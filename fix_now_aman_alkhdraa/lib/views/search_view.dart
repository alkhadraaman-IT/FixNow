import '/provider/service_provider.dart';

import '/provider/search_query_provider.dart';
import '/provider/search_result_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/views/details_view.dart';
import 'package:flutter/material.dart';

import '../models/service_model.dart';
import '../widgets/card_widget.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key});

  @override
  ConsumerState<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  @override
  void initState() {
    //* ايقاف SearchController
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var searchedService = ref.watch(searchResultProvider);
    double screenWidth = MediaQuery.widthOf(context);
    double screenHeight = MediaQuery.heightOf(context);
    SearchController search = SearchController();
   
    return Scaffold(
      appBar: AppBar(title: Text('FixNow')),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SearchAnchor.bar(
              searchController: search,
              barHintText: 'Search services or professionals ...',
              onChanged: (value) {
                ref
                    .read(searchQueryProvider.notifier)
                    .updateQuery(query: value);
              },

              suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
                    final String input = controller.value.text;
                    List<ServiceModel> services = searchedService.value!;
                    return services
                        .where(
                          (item) => services[item.id!].name!.contains(input),
                        )
                        .map(
                          (filterItem) =>
                              ListTile(title: Text(filterItem.name!)),
                        );
                  },
            ),

            //!======================================================
            // TextFormField(
            //   onChanged: (value) {
            //     ref
            //         .read(searchQueryProvider.notifier)
            //         .updateQuery(query: value);
            //   },
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
            searchedService.when(
              data: (data) {
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
              error: (Object error, StackTrace stackTrace) {
                return Center(
                  child: Column(
                    children: [
                      Icon(Icons.warning_sharp, size: 40),
                      Text(
                        error.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                );
              },
              loading: () {
                return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
