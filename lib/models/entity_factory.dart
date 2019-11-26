
import 'package:flutter_app/models/details_entity.dart';
import 'package:flutter_app/models/login_entity.dart';
import 'package:flutter_app/models/store_entity.dart';

import 'category_entity.dart';
import 'goods_entity.dart';
import 'hot_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "StoreEntity") {
      return StoreEntity.fromJson(json) as T;
    } else if (T.toString() == "GoodsEntity"){
      return GoodsEntity.fromJson(json) as T;
    }else if (T.toString() == "CategoryEntity"){
      return CategoryEntity.fromJson(json) as T;
    }else if (T.toString() == "DetailsEntity"){
      return DetailsEntity.fromJson(json) as T;
    }else if (T.toString() == "LoginEntity"){
      return LoginEntity.fromJson(json) as T;
    }else if (T.toString() == "HotEntity"){
      return HotEntity.fromJson(json) as T;
    }
    else {
      return null;
    }
  }
}