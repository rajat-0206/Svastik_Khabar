import 'package:flutter/material.dart';
import 'listview.dart';

class newsWidget extends StatelessWidget {
  NewsView item;
  newsWidget({this.item});
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 20,
        child: Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(item.imageUrl), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  item.title.toString(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person),
                  Text(
                    item.author.toString() == "null"
                        ? "Unknown Author"
                        : item.author.toString(),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.date_range),
                  Text(
                    item.date.toString(),
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
