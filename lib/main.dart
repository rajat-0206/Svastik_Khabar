import 'package:flutter/material.dart';
import 'package:svastik_khabar/getnews.dart';
import 'package:svastik_khabar/newsdetails.dart';
import 'package:svastik_khabar/tabs/listview.dart';
import 'package:svastik_khabar/tabs/newsWidget.dart';
import 'package:svastik_khabar/tabs/searchbar.dart';

dynamic result = "waiting";
dynamic sports = "waiting",
    business = "waiting",
    technology = "waiting",
    politics = "waiting",
    entertainment = "waiting",
    health = "waiting",
    science = "waiting";

_getNews() async {
  sports = await getNews().News("sports");
  politics = await getNews().News("general");
  entertainment = await getNews().News("entertainment");
  business = await getNews().News("business");
  technology = await getNews().News("technology");
  health = await getNews().News("health");
  science = await getNews().News("science");
}

void main() async {
  runApp(MaterialApp(
    home: MyApp(),
    themeMode: ThemeMode.system,
    debugShowCheckedModeBanner: false,
  ));
  WidgetsFlutterBinding.ensureInitialized(); //all widgets are rendered here
  await _getNews();
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  List<Tab> _tabs = [
    Tab(
      child: Text("Trending"),
    ),
    Tab(
      child: Text("Sports"),
    ),
    Tab(
      child: Text("Politics"),
    ),
    Tab(
      child: Text("Entertainment"),
    ),
    Tab(
      child: Text("Technology"),
    ),
    Tab(
      child: Text("Finance"),
    ),
    Tab(
      child: Text("Health"),
    ),
    Tab(
      child: Text("Science"),
    ),
  ];

  TabController _tabController;

  _getnews(topic) async {
    List data = await getNews().News(topic);
    setState(() {
      result = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _getnews("india");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 110,
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 5,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Svastik",
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              SizedBox(
                width: 5,
              ),
              Text("NEWS",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  )),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        showSearch(context: context, delegate: search());
                      },
                      color: Colors.black),
                ),
              )
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: TabBar(
              physics: BouncingScrollPhysics(),
              indicatorColor: Colors.black,
              isScrollable: true,
              labelColor: Colors.black,
              labelStyle: TextStyle(
                fontSize: 20,
              ),
              controller: _tabController,
              tabs: _tabs,
            ),
          ),
        ),
        body: TabBarView(
            physics: ClampingScrollPhysics(),
            controller: _tabController,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: result == "waiting"
                    ? Center(child: CircularProgressIndicator())
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
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: sports == "waiting"
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: sports.length,
                        itemBuilder: (context, index) {
                          return sports[index]['urlToImage'] == null
                              ? SizedBox(
                                  height: 1,
                                )
                              : InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Details(
                                                url: sports[index]['url'])));
                                  },
                                  child: newsWidget(
                                      item: NewsView(
                                          imageUrl: sports[index]['urlToImage'],
                                          title: sports[index]['title'],
                                          author: sports[index]['author'],
                                          date: sports[index]['publishedAt'])),
                                );
                        }),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: politics == "waiting"
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: politics.length,
                        itemBuilder: (context, index) {
                          return politics[index]['urlToImage'] == null
                              ? SizedBox(
                                  height: 1,
                                )
                              : InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Details(
                                                url: politics[index]['url'])));
                                  },
                                  child: newsWidget(
                                      item: NewsView(
                                          imageUrl: politics[index]
                                              ['urlToImage'],
                                          title: politics[index]['title'],
                                          author: politics[index]['author'],
                                          date: politics[index]
                                              ['publishedAt'])),
                                );
                        }),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: entertainment == "waiting"
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: entertainment.length,
                        itemBuilder: (context, index) {
                          return entertainment[index]['urlToImage'] == null
                              ? SizedBox(
                                  height: 1,
                                )
                              : InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Details(
                                                url: entertainment[index]
                                                    ['url'])));
                                  },
                                  child: newsWidget(
                                      item: NewsView(
                                          imageUrl: entertainment[index]
                                              ['urlToImage'],
                                          title: entertainment[index]['title'],
                                          author: entertainment[index]
                                              ['author'],
                                          date: entertainment[index]
                                              ['publishedAt'])),
                                );
                        }),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: technology == "waiting"
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: technology.length,
                        itemBuilder: (context, index) {
                          return technology[index]['urlToImage'] == null
                              ? SizedBox(
                                  height: 1,
                                )
                              : InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Details(
                                                url: technology[index]
                                                    ['url'])));
                                  },
                                  child: newsWidget(
                                      item: NewsView(
                                          imageUrl: technology[index]
                                              ['urlToImage'],
                                          title: technology[index]['title'],
                                          author: technology[index]['author'],
                                          date: technology[index]
                                              ['publishedAt'])),
                                );
                        }),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: business == "waiting"
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: business.length,
                        itemBuilder: (context, index) {
                          return business[index]['urlToImage'] == null
                              ? SizedBox(
                                  height: 1,
                                )
                              : InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Details(
                                                url: business[index]['url'])));
                                  },
                                  child: newsWidget(
                                      item: NewsView(
                                          imageUrl: business[index]
                                              ['urlToImage'],
                                          title: business[index]['title'],
                                          author: business[index]['author'],
                                          date: business[index]
                                              ['publishedAt'])),
                                );
                        }),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: health == "waiting"
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: health.length,
                        itemBuilder: (context, index) {
                          return health[index]['urlToImage'] == null
                              ? SizedBox(
                                  height: 1,
                                )
                              : InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Details(
                                                url: health[index]['url'])));
                                  },
                                  child: newsWidget(
                                      item: NewsView(
                                          imageUrl: health[index]['urlToImage'],
                                          title: health[index]['title'],
                                          author: health[index]['author'],
                                          date: health[index]['publishedAt'])),
                                );
                        }),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: science == "waiting"
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: science.length,
                        itemBuilder: (context, index) {
                          return science[index]['urlToImage'] == null
                              ? SizedBox(
                                  height: 1,
                                )
                              : InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Details(
                                                url: science[index]['url'])));
                                  },
                                  child: newsWidget(
                                      item: NewsView(
                                          imageUrl: science[index]
                                              ['urlToImage'],
                                          title: science[index]['title'],
                                          author: science[index]['author'],
                                          date: science[index]['publishedAt'])),
                                );
                        }),
              ),
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              result = "waiting";
            });
            _getnews("india");
          },
          child: Icon(Icons.refresh),
        ));
  }
}
