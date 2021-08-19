import 'package:flutter/material.dart';

void main() => runApp(MyTabedPage());

class MyTabedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page'
        ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyTabPageState createState() => _MyTabPageState();
}

class _MyTabPageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTab = <Tab>[
    Tab(text: "Tab1"),
    Tab(text: "Tab2"),
    Tab(text: "Tab3"),
    Tab(text: "Tab4"),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTab.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom:    TabBar(
          controller: _tabController,
          tabs: myTab,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTab.map((Tab tab) {
          return Center(child: Text(tab.text));
        }).toList(),
      ),
    );
  }
}
