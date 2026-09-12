import 'package:fix_now_aman_alkhdraa/core/config/di.dart';

import '/core/constants/app_key.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import '../models/cart_item_model.dart';
import '/models/service_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = AsyncNotifierProvider<CartProvider, List<ServiceModel>>(
  () {
    // return CartProvider(cartBox: getIt.get<Box<ServiceModel>>());
    // final cartBox=Hive.box<ServiceModel>(cartBox);
    final cartBox=Hive.box<ServiceModel>(AppKeys.cartBoxKey);
    print("cartBox:${cartBox.values}''''''''''''");
    return CartProvider(cartBox: cartBox);
  },
);

class CartProvider extends AsyncNotifier<List<ServiceModel>> {
  final Box<ServiceModel> cartBox;
  
  CartProvider({required this.cartBox});
  double get totalPrice => cartBox.values.fold(0, (sum, item) {
    print('<<<<<<<<<<<<<< totalPrice >>>>>>>>>>>>>>>>');
    // print('cartBoxToList:::::::${cartBox.values.toList()}');
    // print('cartBoxToString:::::::${cartBox.values.toString()}');
    print('cartBox:::::::${cartBox.values}');
    print('item:${item}');
    print('sum:$sum');
    print('price:${item.price}');

    print('name:${item.name}');
    return sum + item.price!;
    // return sum + (item.quatity * item.price!);
  });
  @override
  Future<List<ServiceModel>> build() async {
    print('<<<<<<<<<<<<<< build CartProvider >>>>>>>>>>>>>>>>');
    print('cartBox.values:${cartBox.values.toList()}');
    List<ServiceModel> services = cartBox.values.toList();
    print('services cart:$services');
    return services;
  }

  addToCart({required ServiceModel service}) async {
    print('<<<<<<<<<<<<<< addToCart >>>>>>>>>>>>>>>>');
    final existingItemIndex = cartBox.values.toList().indexWhere(
      (element) => element.id == service.id,
    );
    // if (existingItemIndex != -1) {
    //   final existingItem = cartBox.getAt(existingItemIndex);
    //   if (existingItem!=null) {
    //     existingItem.quatity++;
    //     existingItem.save();
    //   }
    // } else {
    print("existingItemIndex:$existingItemIndex");
    if (existingItemIndex == -1) {

      await cartBox.put(service.id, service);
    } // }
    List<ServiceModel> services = cartBox.values.toList();
    print('services cart:$services.......');
    print('cartBox.toString:${cartBox.toString()}...............');
    print('cartBox:${cartBox.values}...............');
    print("${AsyncData(services).value}*-*-*-*-*-*-");
    state = AsyncData(services);
  }

  removeFromCart({required int itemId}) async {
    print('<<<<<<<<<<<<<< removeFromCart >>>>>>>>>>>>>>>>');
    await cartBox.delete(itemId);
    List<ServiceModel> services = cartBox.values.toList();
    state = AsyncData(services);
  }

  // updateQuantity({required int newQuantity, required int itemId}) async {
  //   if (newQuantity <= 0) {
  //     await cartBox.delete(itemId);
  //   } else {
  //     final tempItem = cartBox.get(itemId);
  //     if (tempItem != null) {
  //       tempItem.quatity = newQuantity;
  //       tempItem.save();
  //     }
  //   }
  //   List<ServiceModel> services = cartBox.values.toList();
  //   state = AsyncData(services);
  // }

  bool isInCartService(ServiceModel service) {
    print('<<<<<<<<<<<<<< isInCartService >>>>>>>>>>>>>>>>');
        List<ServiceModel> services = cartBox.values.toList();

    bool isInCart = services.any((element) {
      return element.id == service.id;
    });
    return isInCart;
  }
}
