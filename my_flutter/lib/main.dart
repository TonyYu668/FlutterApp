import 'package:flutter/material.dart';
import 'dart:ui';

void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {
  switch (route) {
    case 'route_create_main_view':
      return AddViewWidget("the view from flutter");
    case 'route_create_main_fragment':
      return AddFragmentidget("  the fragment from flutter");
    default:
      return Center(
        child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
      );
  }
}

class AddViewWidget extends StatelessWidget {

  String name;

  AddViewWidget(@required this.name) :super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Color(0xFF99CCFF),
      child: Center(
        child: Text(name, textDirection: TextDirection.ltr,),
      ),
    );
  }
}

class AddFragmentidget extends StatelessWidget {

  final String name;

  AddFragmentidget(@required this.name) :super();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: name,
      //主题配置
      theme: ThemeData(
        //应用程序整体主题的亮度
        brightness: Brightness.light,
        //App主要部分的背景色
        primaryColor: Colors.lightGreen[600],
        //前景色（文本、按钮等）
        accentColor: Colors.orange[600],
      ),
      home: MyHomePage(
        title: name,
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          //获取主题的accentColor
          color: Theme.of(context).accentColor,
          child: Text(
            '我是文本',
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      floatingActionButton: Theme(
        //使用copyWith的方式获取accentColor
        data: Theme.of(context).copyWith(accentColor: Colors.grey),
        child: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.computer),
        ),
      ),
    );
  }
}