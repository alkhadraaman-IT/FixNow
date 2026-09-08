import 'package:hive_ce_flutter/adapters.dart';

import '/models/service_model.dart';
part 'cart_item_model.g.dart';

@HiveType(typeId: 2)
class CartItemModel {
  @HiveField(0)
  ServiceModel serviceModel;
  @HiveField(1)
  int quatity;
  CartItemModel({required this.serviceModel, this.quatity = 1});
}
