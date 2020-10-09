import 'package:flutter/material.dart';
import 'package:svastik_khabar/getnews.dart';
import 'package:svastik_khabar/tabs/newsWidget.dart';

dynamic result = "waiting";
dynamic sports = "waiting",
    business = "waiting",
    technology = "waiting",
    politics = "waiting",
    entertainment = "waiting";

_getNews() async {
  sports = await getNews().News("sports");
  politics = await getNews().News("politics");
  entertainment = await getNews().News("entertainment");
  business = await getNews().News("business");
  technology = await getNews().News("technology");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //all widgets are rendered here
  await _getNews();
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
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
    // Tab(
    //   child: Text("World"),
    // ),
    Tab(
      child: Text("Finance"),
    ),
  ];

  TabController _tabController;

  _getnews(topic) async {
    List data = await getNews().News(topic);
    setState(() {
      result = data;
    });
  }

// setState(() async {
//       sports = await getNews().News("sports");
//       politics = await getNews().News("politics");
//       entertainment = await getNews().News("entertainment");
//       business = await getNews().News("business");
//       technology = await getNews().News("technology");
//     });
  @override
  void initState() {
    // TODO: implement initState
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
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () {},
        //   color: Colors.black,
        // ),
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
            Text("Khabar",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ))
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
          physics: BouncingScrollPhysics(),
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
                        return InkWell(
                          onTap: () {},
                          child: newsWidget(item: result[index]),
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
                        return InkWell(
                          onTap: () {},
                          child: newsWidget(item: sports[index]),
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
                        return InkWell(
                          onTap: () {},
                          child: newsWidget(item: politics[index]),
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
                        return InkWell(
                          onTap: () {},
                          child: newsWidget(item: entertainment[index]),
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
                        return InkWell(
                          onTap: () {},
                          child: newsWidget(item: technology[index]),
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
                        return InkWell(
                          onTap: () {},
                          child: newsWidget(item: business[index]),
                        );
                      }),
            ),
          ]),
    );
  }
}
