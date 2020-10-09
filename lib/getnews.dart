import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:svastik_khabar/tabs/listview.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:svastik_khabar/tabs/newsWidget.dart';

class getNews {
  Future<List> News(String topic) async {
    String url = "";
    if (topic == "india") {
      url =
          'https://newsapi.org/v2/top-headlines?country=in&apiKey=2d8de2436029478eb0990acff8c48a38';
    } else {
      url = 'https://newsapi.org/v2/top-headlines?country=in&category=' +
          topic +
          '&apiKey=2d8de2436029478eb0990acff8c48a38';
    }
    final response = await http.get(url);
    final data = json.decode(response.body);
    List khabar = data['articles'];
    List<NewsView> listTiles = [];
    for (final i in khabar) {
      if (i['author'] == null ||
          i['title'] == null ||
          i['urlToImage'] == null ||
          i['publishedAt'] == null) continue;
      NewsView temp = new NewsView();
      temp.author = i['author'];
      temp.title = i['title'];
      temp.imageUrl = i['urlToImage'];
      temp.date = i['publishedAt'];
      listTiles.add(temp);
    }
    return listTiles;
  }
}
