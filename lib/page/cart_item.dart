
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/cart_goods_query_entity.dart';
import 'package:flutter_app/page/count_item.dart';
import 'package:flutter_app/receiver/event_bus.dart';
import 'package:flutter_app/utils/app_size.dart';
import 'package:flutter_app/view/theme_ui.dart';

class CartItem extends StatelessWidget {
  final GoodsModel model;

  CartItem(this.model);
  String imgUrl = "http://linjiashop-mobile-api.microapp.store/file/getImgStream?idFile=";
  @override
  Widget build(BuildContext context) {
//    print(item);
   return Container(
      height: AppSize.height(350),
      margin: EdgeInsets.fromLTRB(5.0,2.0,5.0,2.0),
      padding: EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(width:1,color:Colors.black12)
          )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _cartCheckBt(context,model),
          _cartImage(model),
          _cartGoodsName(model),
        ],
      ),
    );

  }
  //多选按钮
  Widget _cartCheckBt(BuildContext context,GoodsModel item){
    return Expanded(
      child:Container(
        width: AppSize.width(150),
        height: AppSize.height(232),

        child:Checkbox(
                value: item.isCheck,
                activeColor:Colors.pink,
                onChanged: (bool val){
                  item.isCheck=val;
                  eventBus.fire(new GoodsNumInEvent("state"));
                },
              )),

      flex: 1,
    );
  }
  //商品图片
  Widget _cartImage(GoodsModel item){

    return Container(
      width: AppSize.height(232),
      height: AppSize.height(232),
      margin: EdgeInsets.only(left: 15),
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8)),
          child:Image(image:CachedNetworkImageProvider(imgUrl+item.pic),fit: BoxFit.cover,)),
    );
  }
  //商品名称
  Widget _cartGoodsName(GoodsModel item){
    return
      Expanded(
        child: Container(
          width:AppSize.width(350),
          margin: EdgeInsets.only(left: 10.0, top: 10.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(item.name, textAlign: TextAlign.left,
                  style: ThemeTextStyle.cardTitleStyle),
              Text(item.descript, textAlign: TextAlign.left,
                  style: ThemeTextStyle.cardTitleStyle),
              Text('￥${(item.price/100).toStringAsFixed(2)}',
                  textAlign: TextAlign.left,
                  style: ThemeTextStyle.cardPriceStyle),
              CartCount(item)
            ],
          ),
        ),
        flex: 3,
      );
  }

}