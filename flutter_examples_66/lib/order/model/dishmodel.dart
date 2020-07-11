
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

class DishModel with ChangeNotifier {
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
        Dish(1, '拍黄瓜（大）', 50,image: Image.asset('images/0.jpg', fit: BoxFit.contain,),detail: '这是拍黄瓜（大）'),
        Dish(2, '拍黄瓜（小）', 30, image: Image.asset('images/0.jpg', fit: BoxFit.contain,), detail: '这是拍黄瓜（小）'),
        Dish(3, '凉皮（大）', 60, image:Image.asset('images/1.jpg', fit: BoxFit.contain,), detail: '这是凉皮（大）'),
        Dish(4, '凉皮（小）', 40,image: Image.asset('images/1.jpg', fit: BoxFit.contain,),detail: '这是凉皮（小）')
      ];
    });
    notifyListeners();
  }
}
