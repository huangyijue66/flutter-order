import 'package:flutter/material.dart';
import 'package:flutterexamples66/order/model/cartmodel2.dart';
import 'package:flutterexamples66/order/model/dishmodel2.dart';
import 'package:provider/provider.dart';

class DishDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DishDetail2State();
  }

}

class DishDetail2State extends State<DishDetail> {
  DishModel2 dishModel;
  CartModel2 cart;
  Dish dish;

  int _currentIndex = 0;

  // 可以保存状态
  _change(int index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    dishModel = Provider.of<DishModel2>(context);
    dish = dishModel.getCurrentDish();
    cart = Provider.of<CartModel2>(context);

    return Scaffold(
      appBar: AppBar(title: Text('${dish.name}'),),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.orange,
        onTap: _change,
        currentIndex: _currentIndex,
        items: _listItems(),
      ),
      //body: _children[_currentIndex],
      body: PageView.builder(
        itemCount: _listChildren(dish).length,
        itemBuilder: (context, _) {
          return _listChildren(dish)[_currentIndex];
        },
        onPageChanged: _change,
      ),
    );
  }

  List<BottomNavigationBarItem> _listItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.image),
        title: Text('图片'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.book),
        title: Text('简介'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.comment),
        title: Text('评论'),
        //backgroundColor: Colors.orange
      ),

    ];
  }

  List<Widget> _listChildren(Dish dish) {
    return [
      MyImage(dish),
      MyDetail(dish),
      MyComment(),
    ];
  }
}

class MyContainer extends StatelessWidget {
  final String title;

  MyContainer(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      title,
      style: TextStyle(fontSize: 40, color: Colors.pink),
    );
  }
}

class MyImage extends StatelessWidget{
  final Dish dish;

  MyImage(this.dish);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Container(
        width: 100,
        height: 100,
        child: dish.image,
      );
  }
}

class MyDetail extends StatelessWidget {
  final Dish dish;

  MyDetail(this.dish);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.orange,
      elevation: 24,
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.restaurant, size: 70,),
                Column(
                  children: <Widget>[
                    Text('简介',style: TextStyle(
                        fontSize: 40
                    ),),
                  ],
                )
              ],
            ),
            Divider(color: Colors.white,),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('${dish.detail}', style: TextStyle(fontSize: 30, color: Colors.white),),
              ],
            )
          ],
        ),
      ),
    );
  }

}

class MyComment extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text('赞！'),
            trailing: Icon(Icons.favorite_border),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('好吃！'),
            trailing: Icon(Icons.favorite_border),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('美味！'),
            trailing: Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }

}

class Mytuanzhang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: <Widget>[
          Text('data')
        ],
      ),
    );
  }

}