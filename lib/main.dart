import 'package:flutter/cupertino.dart';
import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:bruno/bruno.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:getwidget/getwidget.dart';

void main() => runApp(MyApp());
final _navigatorKey = GlobalKey<NavigatorState>();

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hello World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
            message: "AL",
            location: BannerLocation.topEnd,
            color: Colors.red,
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static int _counter = 15;

  // Initial Route: /category/5/item/15
  final pages = [
    MyPage(
      key: ValueKey('/'),
      name: '/',
      builder: (context) => HomeScreen(),
    ),
    MyPage(
      key: ValueKey('/category/5'),
      name: '/category/5',
      builder: (context) => CategoryScreen(id: 5),
    ),
    MyPage(
      key: ValueKey('/item/15'),
      name: '/item/15',
      builder: (context) => ItemScreen(id: 15),
    ),
  ];

  String? str = "123";

  void tt() async {
    int n = str?.length ?? 0;
    bool s = await _navigatorKey.currentState?.maybePop() ?? false;
  }

  void addPage(MyPage page) {
    setState(() => pages.add(page));
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    setState(() => pages.remove(route.settings));
    return route.didPop(result);
  }

  @override
  Widget build(BuildContext context) {
    print('build: $pages');
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            bool result = await _navigatorKey.currentState?.maybePop() ?? false;
            return result;
          },
          child: Navigator(
            key: _navigatorKey,
            onPopPage: _onPopPage,
            pages: List.of(pages),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              final int id = ++_counter;
              pages.add(
                MyPage(
                  key: ValueKey('/item/$id'),
                  name: '/item/$id',
                  builder: (context) => ItemScreen(id: id),
                ),
              );
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class MyPage<T> extends Page<T> {
  MyPage({
    required LocalKey? key,
    required String? name,
    required this.builder,
  }) : super(key: key, name: name);

  final WidgetBuilder builder;

  @override
  Route<T> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: builder,
    );
  }

  @override
  String toString() => '$name';
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.red,
      child: Center(
        child: Text(
          'Home',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key, this.id}) : super(key: key);

  final int? id;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
      child: Center(
        child: Text(
          'Category $id',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}

class ItemScreen extends StatelessWidget {
  const ItemScreen({Key? key, this.id}) : super(key: key);

  final int? id;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: Center(
        child: Text(
          "Item $id\n${ModalRoute.of(context)?.settings}",
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
