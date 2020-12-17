import 'package:flutter/material.dart';
import 'package:thanos/pages/person/pool.dart';
import 'package:thanos/pages/person/repository.dart';
import 'package:thanos/utils/utils.dart';
import 'package:thanos/widgets/widgets.dart';

class PersonPage extends StatefulWidget {
  PersonPage({Key key}) : super(key: key);

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  final List<String> _tabValues = ['公共库', '我的客户'];
  TabController _controller;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: _tabValues.length,
      vsync: ScrollableState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: customerAppBar(
        avatar:
            "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=250",
        controller: _controller,
        onLeadingPress: () {
          _scaffoldKey.currentState.openDrawer();
        },
        onSearchTap: toSearch,
        tabs: _tabValues.map((f) {
          return Text(
            f,
            style: TextStyle(
              fontSize: duSetFontSize(36),
              fontWeight: FontWeight.w600,
            ),
          );
        }).toList(),
      ),
      drawer: userDrawer(),
      body: TabBarView(
        controller: _controller,
        children: [
          PoolPage(),
          RePositoryPage(),
        ],
      ),
    );
  }

  void toSearch() {
    print('to Search');
    print(_controller.index);
  }
}
