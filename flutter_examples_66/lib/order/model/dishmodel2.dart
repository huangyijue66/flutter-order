
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dish {
  int id;
  String name;
  double price;
  Image image;
  String detail;

  Dish(this.id, this.name, this.price, {this.image, this.detail});
}

class DishModel2 with ChangeNotifier {
  List<Dish> _dishes = [];
  Dish _currentDish;

  Dish getCurrentDish() {
    return _currentDish;
  }

  void setCurrentDish(Dish dish) {
    _currentDish = dish;
    notifyListeners();
  }

  List<Dish> listDishes() {
    return _dishes;
  }


  loadDishes() async{
    _dishes = await Future.delayed(Duration(seconds: 2),(){
      return[
        Dish(1, '地三鲜（大）', 50,image: Image.asset('images/2.jpg', fit: BoxFit.contain,),detail: '这是地三鲜（大）'),
        Dish(2, '地三鲜（小）', 30, image: Image.asset('images/2.jpg', fit: BoxFit.contain,), detail: '这是地三鲜（小）'),
        Dish(3, '烧茄子（大）', 60, image:Image.asset('images/3.jpg', fit: BoxFit.contain,), detail: '这是烧茄子（大）'),
        Dish(4, '烧茄子（小）', 40,image: Image.asset('images/3.jpg', fit: BoxFit.contain,),detail: '这是烧茄子（小）')
      ];
    });
    notifyListeners();
  }
}
