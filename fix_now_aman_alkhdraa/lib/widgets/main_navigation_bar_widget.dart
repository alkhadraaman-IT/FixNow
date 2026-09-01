import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../views/cart_view.dart';
import '../views/favorites_view.dart';
import '../views/home_view.dart';
import '../views/profile_view.dart';

class MainNavigationBarWidget extends StatefulWidget {
  const MainNavigationBarWidget({super.key});

  @override
  State<MainNavigationBarWidget> createState() =>
      _MainNavigationBarWidgetState();
}

class _MainNavigationBarWidgetState extends State<MainNavigationBarWidget> {
  List<Widget> listView = [
    HomeView(),
    CartView(),
    FavoritesView(),
    ProfileView(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: selectedIndex == 0
          ? AppBar(
              centerTitle: false,
              leading: SizedBox(
                height: 40.h,
                width: 40.w,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20.r),
                  child: CircleAvatar(
                    child: Image.network(
                      'https://tse1.mm.bing.net/th/id/OIP.PKlD9uuBX0m4S8cViqXZHAHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
                      fit: .fill,
                    ),
                  ),
                ),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.nightlife)),
              ],
              title: Column(
                crossAxisAlignment: .start,
                children: [
                  Text('data'),
                  Text('data', style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            )
          : AppBar(title: Text('FixNow'), centerTitle: true),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (int newValue) {
          selectedIndex = newValue;
          setState(() {});
        },
        //! ما لازم هون ==================================
              backgroundColor: Color(0xffF9F9F8),

        indicatorColor: Color(0xff).withAlpha(0),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
            selectedIcon: Icon(Icons.shopping_cart),
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline_sharp),
            label: 'Favorites',
            selectedIcon: Icon(Icons.favorite),
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
            selectedIcon: Icon(Icons.person),
          ),
        ],
      ),
      body: listView[selectedIndex],
    );
  }
}
