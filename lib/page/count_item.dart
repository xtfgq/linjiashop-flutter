
import 'package:flutter/material.dart';
import 'package:flutter_app/models/cart_goods_query_entity.dart';
import 'package:flutter_app/receiver/event_bus.dart';
import 'package:flutter_app/utils/app_size.dart';

class CartCount extends StatelessWidget {
  GoodsModel item;
  CartCount(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.width(190.0),
      height:AppSize.width(65),
      margin: EdgeInsets.only(top:5.0),
      decoration: BoxDecoration(
          border:Border.all(width: 1 , color:Colors.black12)
      ),
      child: Row(
        children: <Widget>[
          _reduceBtn(context),
          _countArea(),
          _addBtn(context),
        ],
      ),

    );
  }
  // 减少按钮
  Widget _reduceBtn(context){
    return InkWell(
      onTap: (){
        item.countNum--;
        eventBus.fire(new GoodsNumInEvent("sub"));
      },
      child: Container(
        width:AppSize.width(55),
        height:AppSize.width(55),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: item.countNum>1?Colors.white:Colors.black12,
            border:Border(
                right:BorderSide(width:1,color:Colors.black12)
            )
        ),
        child:item.countNum>1? Text('-'):Text(' '),
      ),
    );
  }

  //添加按钮
  Widget _addBtn(context){
    return InkWell(
      onTap: (){
        item.countNum++;
        eventBus.fire(new GoodsNumInEvent("add"));
      },
      child: Container(
        width:AppSize.width(55),
        height:AppSize.width(55),
        alignment: Alignment.center,

        decoration: BoxDecoration(
            color: Colors.white,
            border:Border(
                left:BorderSide(width:1,color:Colors.black12)
            )
        ),
        child: Text('+'),
      ),
    );
  }

  //中间数量显示区域
  Widget _countArea(){
    return Container(
      width:AppSize.width(70),
      height:AppSize.width(45),
      alignment: Alignment.center,
      color: Colors.white,
      child: Text('${item.countNum}'),
    );
  }

}