
import 'package:flutter/material.dart';
import 'package:flutterexamples66/order/model/cartmodel.dart';
import 'package:flutterexamples66/order/model/dishmodel.dart';
import 'package:flutterexamples66/order/model/tablemodel.dart';
import 'package:provider/provider.dart';

class Kind extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('菜品种类'),
      ),
      body: Column(
        children: <Widget>[
          Container(
              height: 301.5,
              width: 411,
              decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2)),
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/dish');
                },
                child: Text('凉菜',style: TextStyle(fontSize: 50),),
              color: Colors.blue,)
          ),
          Container(
              height: 301.5,
              width: 411,
              decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2)),
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/dish2');
                },
                child: Text('热菜',style: TextStyle(fontSize: 50),),
                color: Colors.red,)
          )
        ],
      ),
    );
  }

}