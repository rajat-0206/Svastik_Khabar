import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'dart:async';
import 'dart:convert';
import 'package:svastik_khabar/searchresult.dart';

class search extends SearchDelegate<String> {
  List history = ["Noida", "India"];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
            close(context, null);
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
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    showResults(context);
    if (query != "") {
      return searchresult(query: query);
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    history = [];
    if (query != "") history.add("Search for $query");
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () => {
          showResults(context),
          searchresult(query: query)},
        leading: Icon(Icons.read_more),
        title: Text(history[index]),
      ),
      itemCount: history.length,
    );
  }
}
