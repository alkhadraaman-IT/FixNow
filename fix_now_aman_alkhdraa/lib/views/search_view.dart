import '../provider/search_provider.dart';
import '../widgets/dialog_no_net_widget.dart';
import '../widgets/fix_now_app_bar_widget.dart';
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
  void dispose() {
    search.dispose();
    super.dispose();
  }

  SearchController search = SearchController();

  @override
  Widget build(BuildContext context) {
    var searchedService = ref.watch(searchProvider);
    // var searchedService = ref.watch(searchResultProvider);
    double screenWidth = MediaQuery.widthOf(context);
    double screenHeight = MediaQuery.heightOf(context);

    return Scaffold(
      // appBar: FixNowAppBarWidget(),
      appBar: AppBar(title: Text('FixNow')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            // SearchAnchor.bar(
            //   searchController: search,
            //   barHintText: 'Search services or professionals ...',
            //   // shrinkWrap: true,
            //   isFullScreen: false,

            //   onChanged: (value) {
            //     // ref
            //     //     .read(searchQueryProvider.notifier)
            //     //     .updateQuery(query: value);
            //     ref
            //         .read(searchProvider.notifier)
            //         .updateQuerySearch(query: value);
            //   },

            //   suggestionsBuilder:
            //       (BuildContext context, SearchController controller) {
            //         final String input = controller.value.text;
            //         List<ServiceModel> services =
            //             searchedService.value!.searchResult;
            //         return services
            //             .where(
            //               (item) => services[item.id!].name!.contains(input),
            //             )
            //             .map(
            //               (filterItem) =>
            //                   ListTile(title: Text(filterItem.name!)),
            //                   // CardWidget(
            //                   //   cardHeight: 368.h,
            //                   //   list: filterItem,
            //                   //   cardWidth: screenWidth.w,
            //                   // ),
            //             );
            //       },
            // ),

            //!======================================================
            TextFormField(
              onChanged: (value) {
                ref
                    .read(searchProvider.notifier)
                    .updateQuerySearch(query: value);
              },

              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xffBDC9C9),
                  size: 24,
                ),
                hintText: 'Search services or professionals ...',

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff006065),width: 2),
                  borderRadius: BorderRadius.circular(100),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff006065),width: 2),
                  borderRadius: BorderRadius.circular(100),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffBDC9C9),width: 2),
                  borderRadius: BorderRadius.circular(100),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffBA1A1A),width: 2),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            searchedService.when(
              data: (data) {
                var searchList = data.searchResult;
                return Expanded(
                  child: ListView.separated(
                    itemCount: searchList.length,
                    // itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsView(service: searchList[index]),
                            ),
                          );
                        },
                        child: CardWidget(
                          cardHeight: 368.h,
                          list: searchList[index],
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
                if (error == 'No internet connection') {
                  return DialogErrorNoNet();
                } else {
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
                }
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
