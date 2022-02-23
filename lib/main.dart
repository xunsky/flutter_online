import 'package:flutter/cupertino.dart';
import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:bruno/bruno.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:getwidget/getwidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text("test3"),
      ),
      body: Center(
          child: Column(
        children: [
          GFButton(
            onPressed: () {
              log('123');
            },
            text: "primary",
          ),
          GFButton(
              size: GFSize.LARGE,
              text: 'View on Github',
              textStyle: const TextStyle(
                fontSize: 16,
                color: GFColors.WHITE,
              ),
              icon: Icon(CupertinoIcons.captions_bubble),
              color: GFColors.SUCCESS,
              blockButton: true,
              onPressed: () {}),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            color: Colors.amber,
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('FlutLab is on your service!'),
            ),
          ),
          Banner(
            message: "ALPHA",
            location: BannerLocation.topEnd,
            color: Colors.red,
          ),
          Text(
            "Hello world! I'm Jack. " * 2,
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
          NeumorphicText(
            "I love flutter",
            style: NeumorphicStyle(
              depth: 4, //customize depth here
              color: Colors.red, //customize color here
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: 18, //customize size here
              // AND others usual text style properties (fontFamily, fontWeight, ...)
            ),
          ),
          GFRating(
            value: 3,
            onChanged: (value) {},
          ),
        ],
      )),
    );
  }
}
