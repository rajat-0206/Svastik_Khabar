import 'package:flutter/material.dart';
import 'package:svastik_khabar/getnews.dart';
import 'package:svastik_khabar/newsdetails.dart';
import 'package:svastik_khabar/tabs/listview.dart';
import 'package:svastik_khabar/tabs/newsWidget.dart';

class searchresult extends StatefulWidget {
  final String query;
  searchresult({@required this.query});
  @override
  _searchresultState createState() => _searchresultState();
}

class _searchresultState extends State<searchresult> {
  dynamic result = "waiting";
  _getnews(topic) async {
    List data = await getNews().searchnews(topic);
    setState(() {
      if (data.length == 0) {
        result = "";
      } else {
        result = data;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getnews(widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Center(
              child: Padding(
        padding: EdgeInsets.all(10.0),
        child: result == "waiting"
            ? Center(child: CircularProgressIndicator())
            : result == ""
                ? Center(
                    child: Text("Sorry! No result for " + widget.query,
                        style: TextStyle(fontSize: 24)))
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: result.length,
                    itemBuilder: (context, index) {
                      return result[index]['urlToImage'] == null
                          ? SizedBox(
                              height: 1,
                            )
                          : InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Details(
                                            url: result[index]['url'])));
                              },
                              child: newsWidget(
                                  item: NewsView(
                                      imageUrl: result[index]['urlToImage'],
                                      title: result[index]['title'],
                                      author: result[index]['author'],
                                      date: result[index]['publishedAt'])),
                            );
                    }),
      ))),
    );
  }
}
