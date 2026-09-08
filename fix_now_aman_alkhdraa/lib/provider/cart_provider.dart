import '/core/constants/app_key.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import '../models/cart_item_model.dart';
import '/models/service_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = AsyncNotifierProvider<CartProvider, List<CartItemModel>>(() {
    return CartProvider(cartBox: Hive.box(AppKeys.cartBoxKey));
  },
);

class CartProvider extends AsyncNotifier<List<CartItemModel>> {
  final Box<CartItemModel> cartBox;
  CartProvider({required this.cartBox});
  double get totalPrice => cartBox.values.fold(0, (sum, item) {
    return sum + (item.quatity * item.serviceModel.price!);
  });
  @override
  Future<List<CartItemModel>> build() async {
    List<CartItemModel> services = cartBox.values.toList();

    return services;
  }

  addToCart({required ServiceModel service}) async {
    // final existingItemIndex = cartBox.values.toList().indexWhere(
    //   (element) => element.serviceModel.id == service.id,
    // );
    // if (existingItemIndex != -1) {
    //   final existingItem = cartBox.getAt(existingItemIndex);
    //   if (existingItem!=null) {
    //     existingItem.quatity++;
    //     existingItem.save();
    //   }
    // } else {
      await cartBox.put(
        service.id,
        CartItemModel(serviceModel: service, quatity: 1),
      );
    // }
    List<CartItemModel> services = cartBox.values.toList();
    state = AsyncData(services);
  }

  removeFromCart({required int itemId}) async {
    await cartBox.delete(itemId);
    List<CartItemModel> services = cartBox.values.toList();
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
  //   List<CartItemModel> services = cartBox.values.toList();
  //   state = AsyncData(services);
  // }

  bool isInCartService(ServiceModel service) {
      bool isInCart = state.value!.any((element) {
        return element.serviceModel.id == service.id;
      });
      return isInCart;
    }
}
