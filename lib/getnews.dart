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
    return khabar;
  }

  Future<List> searchnews(String query) async {
    String url = "";
    url =
        'http://newsapi.org/v2/everything?q=$query&sortBy=popularity&apiKey=2d8de2436029478eb0990acff8c48a38';

    final response = await http.get(url);
    final data = json.decode(response.body);
    List khabar = data['articles'];
    return khabar;
  }
}
