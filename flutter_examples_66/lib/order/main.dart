import 'package:flutter/material.dart';
import "package:flutterexamples66/order/model/cartmodel.dart";
import 'package:flutterexamples66/order/model/cartmodel2.dart';
import 'package:flutterexamples66/order/model/dishmodel.dart';
import 'package:flutterexamples66/order/model/dishmodel2.dart';
import 'package:flutterexamples66/order/model/tablemodel.dart';
import 'package:flutterexamples66/order/model/waitermodel.dart';
import 'package:flutterexamples66/order/screen/cart.dart';
import 'package:flutterexamples66/order/screen/dish.dart';
import 'package:flutterexamples66/order/screen/dish2.dart';
import 'package:flutterexamples66/order/screen/dishdetail.dart';
import 'package:flutterexamples66/order/screen/dishdetail2.dart';
import 'package:flutterexamples66/order/screen/kind.dart';
import 'package:flutterexamples66/order/screen/login.dart';
import 'package:flutterexamples66/order/screen/table.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_)=> DishModel(),
      ),
      ChangeNotifierProvider(
        create: (_)=>DishModel2(),
      ),
      ChangeNotifierProvider(
        create: (_)=>CartModel(),
      ),
      ChangeNotifierProvider(
        create: (_)=>CartModel2(),
      ),
      ChangeNotifierProvider(
        create: (_)=>TableModel(),
      ),
      ChangeNotifierProvider(
        create: (_)=>WaiterModel(),
      ),
    ],
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyTableScreen(),
        '/dish': (context) => Catalog(),
        '/dish2': (context) => Catalog2(),
        '/cart': (context) => Cart(),
        '/dishDetail': (context) => DishDetail2(),
        '/dishDetail2': (context) =>DishDetail(),
        '/login': (context) => Login(),
        '/kind': (context) => Kind(),
      },
    ),);
  }

}

