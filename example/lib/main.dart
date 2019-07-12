import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'widget/sample_list_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // App名字
      title: 'EasyRefresh',
      // App主题
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      // 主页
      home: _Example(),
//      localizationsDelegates: const [
//        S.delegate,
//        GlobalMaterialLocalizations.delegate,
//        GlobalWidgetsLocalizations.delegate
//      ],
    );
  }
}

class _Example extends StatefulWidget {
  @override
  _ExampleState createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<_Example> {

  EasyRefreshController _controller;

  // 条目总数
  int _count = 20;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EasyRefresh"),
      ),
      body: Center(
          child: EasyRefresh.custom(
            //enableControlFinishRefresh: true,
            //enableControlFinishLoad: true,
            controller: _controller,
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 2), () {
                print('onRefresh');
                setState(() {
                  _count = 20;
                });
                return 'stop';
              });
            },
            onLoad: () async {
              await Future.delayed(Duration(seconds: 2), () {
                print('onLoad');
                setState(() {
                  _count += 10;
                });
                return 'stop';
              });
            },
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return SampleListItem(
                      text: '$index',
                      bgColor: index%2==0 ? Colors.grey[300] : Colors.transparent,
                    );
                  },
                  childCount: _count,
                ),
              ),
            ],
          )
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(
            onPressed: () {
              _controller.finishRefresh(nomore: true);
            },
            child: Text("Refresh", style: TextStyle(color: Colors.black))),
        FlatButton(
            onPressed: () {
              _controller.finishLoad(nomore: true);
            },
            child: Text("Load more", style: TextStyle(color: Colors.black))),
      ]
    );
  }
}