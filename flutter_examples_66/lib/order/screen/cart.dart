import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterexamples66/order/model/cartmodel.dart';
import 'package:flutterexamples66/order/model/cartmodel2.dart';
import 'package:flutterexamples66/order/model/tablemodel.dart';
import 'package:flutterexamples66/order/screen/dish.dart';
import 'package:flutterexamples66/order/screen/dish2.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget{
  TableModel tableModel;
  //CartModel cart;
  //CartModel2 cart2;
  @override
  Widget build(BuildContext context) {
//    cart = Provider.of<CartModel>(context);
//    cart2 = Provider.of<CartModel2>(context);
    tableModel = Provider.of<TableModel>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('点单'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: ItemList()),
          Container(decoration: BoxDecoration(border: Border.all(color:Colors.red,width: 1)),),
          Expanded(child: ItemList2(),),
          ToTalPrice(),
          ToTalPrice2(),
          ToTalPrice3(),
          RaisedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CartModal();
                  });
            },
            child: Text('收款',style: TextStyle(fontSize: 30),),),
          RaisedButton(
            onPressed: () {
              tableModel.takeoff(tableModel.getCurrentTable().id -1);
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CartModal2();
                  });
            },
            child: Text('撤桌',style: TextStyle(fontSize: 30),),),

        ],
      ),
    );
  }

}

class ItemList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<CartModel>(
      builder: (c, cart, child){
        return ListView.separated(
            itemBuilder: (c, index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('${cart.items[index].dish.name}',
                  style: TextStyle(fontSize: 30),),
                  Text('数量: ${cart.items[index].count}',style: TextStyle(fontSize: 20),)
                ],
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: cart.items.length);
      },
    );

  }

}

class ItemList2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<CartModel2>(
      builder: (c, cart2, child){
        return ListView.separated(
            itemBuilder: (c, index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('${cart2.items[index].dish.name}',
                    style: TextStyle(fontSize: 30),),
                  Text('数量: ${cart2.items[index].count}',style: TextStyle(fontSize: 20),)
                ],
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: cart2.items.length);
      },
    );

  }

}

class CartModal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(30),
      child: Image.asset('images/skm.png',fit: BoxFit.contain,),
    );
  }
  
}

class CartModal2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('撤桌成功'),
              RaisedButton(
                child: const Text('确认'),
                onPressed: () => Navigator.of(context).pushNamed('/'),
              )
            ],
          ),
        ));
  }

}

class ToTalPrice3 extends StatelessWidget {
  CartModel cart;
  CartModel2 cart2;
  @override
  Widget build(BuildContext context) {
    cart = Provider.of<CartModel>(context);
    cart2 = Provider.of<CartModel2>(context);
    double a = cart.getTotalPrice();
    double b = cart2.getTotalPrice();
    double c = a+b;
    // TODO: implement build
    return Text('总额:${c}',style: TextStyle(color: Colors.red, fontSize: 40),);
  }

}