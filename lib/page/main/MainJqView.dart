import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/widgets/MainJqItemView.dart';

import 'MainJqDetailView.dart';
import 'asset.dart';

class MainJqView extends StatefulWidget {
  @override
  _MainJqViewState createState() => new _MainJqViewState();
}

class _MainJqViewState extends State<MainJqView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("警情"),
        centerTitle: true,
        leading: null,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () =>
                  showSearch(context: context, delegate: SearchBarDelegate())),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return MainJqItemView(title: jqList[index]);
        },
        itemCount: jqList.length,
        itemExtent: 56,
      ),
    );
  }
}

class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
            showSuggestions(context);
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSuggest
        : jqList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (BuildContext context, int index) {
        return MainJqItemView(title: suggestionList[index]);
      },
      itemExtent: 56,
    );
  }
}
