import 'package:fix_now_aman_alkhdraa/provider/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/config/di.dart';
import '/repos/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../views/cart_view.dart';
import '../views/favorites_view.dart';
import '../views/home_view.dart';
import '../views/profile_view.dart';
import 'fix_now_app_bar_widget.dart';

class MainNavigationBarWidget extends ConsumerStatefulWidget {
  const MainNavigationBarWidget({super.key});

  @override
  ConsumerState<MainNavigationBarWidget> createState() =>
      _MainNavigationBarWidgetState();
}

class _MainNavigationBarWidgetState
    extends ConsumerState<MainNavigationBarWidget> {
  List<Widget> listView = [
    HomeView(),
    CartView(),
    FavoritesView(),
    ProfileView(
      userRepo: UserRepo(
        internetConnectionChecker: getIt.get<InternetConnectionChecker>(),
      ),
    ),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var userListener = ref.watch(userProvider);

    return Scaffold(
      appBar: userListener.when(
        data: (data) {
          return selectedIndex == 0
              ? AppBar(
                  centerTitle: false,
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 40.h,
                      width: 40.w,
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(50.r),
                        child: CircleAvatar(
                          backgroundColor: Color(0xff).withAlpha(0),
                          child: Image.network(
                            
                            data.image!,
                            fit: .fill,
                            errorBuilder: (context, error, stackTrace) => Icon(Icons.person,size: 30,),
                          ),
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
                  ],
                  title: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text('FixNow'),
                      Text(
                        data.firstName.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                )
              : AppBar(title: Text('FixNow'),);
              // FixNowAppBarWidget();
        },
        error: (error, stackTrace) =>
            // FixNowAppBarWidget(),
            AppBar(title: Text('FixNow'),),
        loading: () =>
            AppBar(title: Center(child: CircularProgressIndicator())),
      ),
      bottomNavigationBar: NavigationBar(
      backgroundColor: Color(0xffF9F9F8),
        selectedIndex: selectedIndex,
        onDestinationSelected: (int newValue) {
          selectedIndex = newValue;
          setState(() {});
        },

        indicatorColor: Color(0xff).withAlpha(0),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined,color: Color(0xff3e4949),),
            label: 'Home',
            selectedIcon: Icon(Icons.home,color: Color(0xff006065),),
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined,color: Color(0xff3e4949),),
            label: 'Cart',
            selectedIcon: Icon(Icons.shopping_cart,color: Color(0xff006065),),
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline_sharp,color: Color(0xff3e4949),),
            label: 'Favorites',
            selectedIcon: Icon(Icons.favorite,color: Color(0xff006065),),
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined,color: Color(0xff3e4949),),
            label: 'Profile',
            selectedIcon: Icon(Icons.person,color: Color(0xff006065),),
          ),
        ],
      ),
      body: listView[selectedIndex],
    );
  }
}
