import 'package:flutter/material.dart';
import 'package:flutterexamples66/order/model/waitermodel.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final _controller = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  WaiterModel waiterModel;

  //String _inputValue = '';
  String _password = '';
  String _name = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      //_inputValue = _controller.text;
      setState(() {});
    });
    _nameController.addListener(() {
      _name = _nameController.text;
      setState(() {

      });
    });
    _passwordController.addListener(() {
      _password = _passwordController.text;
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    waiterModel = Provider.of<WaiterModel>(context);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
//          Container(
//            child: TextField(
//                controller: _controller,
//                decoration: InputDecoration(
//                  labelText: '输入',
//                )),
//          ),
//          Divider(),
//          Text('输入的值是：$_inputValue'),
          Container(
            child: TextField(
                style: TextStyle(color: Colors.blue,fontSize: 30),
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: '用户名',
                )),
          ),
          Divider(),
//          Text('输入的值是：$_name'),
          Container(
            child: TextField(
                style: TextStyle(color: Colors.blue,fontSize: 30),
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: '密码',
                )),
          ),
          Divider(),
//          Text('输入的值是：$_password'),
          RaisedButton(
              color: Colors.blue,
              child: Text('登录',style: TextStyle(fontSize: 40),),
              onPressed: () {
                waiterModel.login(_name, _password);
                if(waiterModel.getIsLogin()==true){
                Navigator.of(context).pushNamed('/');
                }
                if(waiterModel.getIsLogin()==false){
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return LoginFalse();
                      });
                }
              })
        ],
      ),
    );
  }
}

class LoginFalse extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(10),
      child: Text('用户名或密码错误!',style: TextStyle(color: Colors.red,fontSize: 30),),//Image.asset('images/skm.png',fit: BoxFit.contain,),
    );
  }

}