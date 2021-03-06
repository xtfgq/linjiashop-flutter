import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/order_form_entity.dart';
import 'package:flutter_app/page/details/order_details.dart';
import 'package:flutter_app/page/details/product_details.dart';
import 'package:flutter_app/page/details/store_details.dart';
import 'package:flutter_app/page/index_page.dart';
import 'package:flutter_app/page/orderform_page.dart';
import 'package:flutter_app/page/reg_and_login.dart';
import 'package:flutter_app/page/secondary/card_voucher.dart';
import 'package:flutter_app/page/secondary/edit_profile.dart';
import 'package:flutter_app/page/secondary/famous_brand.dart';
import 'package:flutter_app/page/secondary/favorite_page.dart';
import 'package:flutter_app/page/secondary/female_channel.dart';
import 'package:flutter_app/page/secondary/follow_page.dart';
import 'package:flutter_app/page/secondary/good_shop.dart';
import 'package:flutter_app/page/secondary/income_record.dart';
import 'package:flutter_app/page/secondary/invite_friends.dart';
import 'package:flutter_app/page/secondary/my_fans.dart';
import 'package:flutter_app/page/secondary/my_scores.dart';
import 'package:flutter_app/page/secondary/nearby_business.dart';
import 'package:flutter_app/page/secondary/new_shop.dart';
import 'package:flutter_app/page/secondary/points_lottery.dart';
import 'package:flutter_app/page/secondary/points_mall.dart';
import 'package:flutter_app/page/secondary/shop_referrer.dart';
import 'package:flutter_app/page/secondary/shop_reward.dart';
import 'package:flutter_app/page/secondary/store_live.dart';
import 'package:flutter_app/page/secondary/super_discount.dart';

class Routes {
  static final Router router = new Router();
  static const ROOT = '/';
  static const POINTS_MALL = '/points_mall';
  static const FAMOUS_BRAND = '/famous_brand';
  static const NEARBY_BUSINESS = '/nearby_business';
  static const FEMALE_CHANNEL = '/female_channel';
  static const STORE_LIVE = '/store_live';
  static const INVITE_FRIENDS = '/invite_friends';
  static const GOOD_SHOP = '/good_shop';
  static const POINTS_LOTTERY = '/points_lottery';
  static const NEW_SHOP = '/new_shop';
  static const SUPER_DISCOUNT = '/super_discount';

  // details
  static const ORDER_DETAILS = '/order_details';
  static const PRODUCT_DETAILS = '/product_details';
  static const store_details = '/store_details';

  // 个人中心二级界面
  static const favorite_page = '/favorite_page';
  static const follow_page = '/follow_page';
  static const my_scores = '/my_scores';
  static const edit_profile = '/edit_profile';
  static const shop_referrer = '/shop_referrer';
  static const card_voucher = '/card_voucher';
  static const my_fans = '/my_fans';
  static const income_record = '/income_record';
  static const shop_reward = '/shop_reward';

  static const login_page = '/login_page';
  static const order_page = '/order_page';



  void _config() {
    router.define(
        ROOT, handler: Handler(handlerFunc: (context, params) => IndexPage()));

    router.define(
        POINTS_MALL, handler: Handler(handlerFunc: (context, params) => PointsMall()));

    router.define(
        FAMOUS_BRAND, handler: Handler(handlerFunc: (context, params) => FamousBrand()));

    router.define(
        NEARBY_BUSINESS, handler: Handler(handlerFunc: (context, params) => NearbyBusiness()));

    router.define(
        FEMALE_CHANNEL, handler: Handler(handlerFunc: (context, params) => FemaleClassroom()));

    router.define(
        STORE_LIVE, handler: Handler(handlerFunc: (context, params) => StoreLive()));

    router.define(
        INVITE_FRIENDS, handler: Handler(handlerFunc: (context, params) => InviteFriends()));

    router.define(
        GOOD_SHOP, handler: Handler(handlerFunc: (context, params) => GoodShop()));

    router.define(
        POINTS_LOTTERY, handler: Handler(handlerFunc: (context, params) => PointsLottery()));

    router.define(
        NEW_SHOP, handler: Handler(handlerFunc: (context, params) => NewShop()));

    router.define(
        '$ORDER_DETAILS/:id', handler: Handler(handlerFunc: (context, params) => OrderDetails(int.parse(params['id'][0]))));

    router.define(
        PRODUCT_DETAILS, handler:
    Handler(handlerFunc: (context, params) => ProductDetails(id:params['id'].first)));


    router.define(
        SUPER_DISCOUNT, handler: Handler(handlerFunc: (context, params) => SuperDiscount()));

    router.define(
        '$store_details/:id', handler: Handler(handlerFunc: (context, params) => StoreDetails(
        int.parse(params['id'][0]))));

    // 个人中心二级界面
    router.define(
        favorite_page, handler: Handler(handlerFunc: (context, params) => FavoritePage()));

    router.define(
        follow_page, handler: Handler(handlerFunc: (context, params) => FollowPage()));

    router.define(
        my_scores, handler: Handler(handlerFunc: (context, params) => MyScoresPage()));

    router.define(
        edit_profile, handler: Handler(handlerFunc: (context, params) => EditProfilePage()));

    router.define(
        shop_referrer, handler: Handler(handlerFunc: (context, params) => ShopReferrerPage()));

    router.define(
        card_voucher, handler: Handler(handlerFunc: (context, params) => CardVoucherPage()));

    router.define(
        my_fans, handler: Handler(handlerFunc: (context, params) => MyFansPage()));

    router.define(
        income_record, handler: Handler(handlerFunc: (context, params) => IncomeRecordPage()));
    router.define(
        shop_reward, handler: Handler(handlerFunc: (context, params) => ShopRewardPage()));
    router.define(
        login_page, handler: Handler(handlerFunc: (context, params) => RegPageAndLoginPage()));
    router.define(
        order_page, handler: Handler(handlerFunc: (context, params) => OrderFormPage()));
  }

  /**
   * 传递多参数
   */
  Future navigateToParams(BuildContext context, String path, {Map<String, dynamic> params}) {
    String query =  "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
//    print('我是navigateTo传递的参数：$query');
    path = path + query;
    return router.navigateTo(context, path, transition: TransitionType.inFromRight);
  }


  Future navigateTo(BuildContext context, String path){

    return router.navigateTo(context,path,transition: TransitionType.inFromRight);
  }
  Future navigateToReplace(BuildContext context, String path,{Map<String, dynamic> params}){
    String query =  "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
//    print('我是navigateTo传递的参数：$query');
    path = path + query;
    return router.navigateTo(context,path,replace: true,transition: TransitionType.inFromRight);
  }

  Future navigateFromBottom(BuildContext context, String path,[String param='']){
    var p = param.isNotEmpty?'$path/$param':path;
    return router.navigateTo(context,p,transition: TransitionType.inFromBottom);
  }

  factory Routes() =>_getInstance();
  static Routes get instance => _getInstance();
  static Routes _instance;

  Routes._internal() {
    _config();
  }
  static Routes _getInstance() {
    if (_instance == null) {
      _instance = new Routes._internal();
    }
    return _instance;
  }
}
