import 'package:flutter/material.dart';
import 'package:devops_demo/database/dao/services.dart';
import 'detail_page_child.dart';

class DetailPage extends StatelessWidget {
  final Services services;

  DetailPage({Key? key, required this.services}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Services services) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 20.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.auto_awesome, color: Colors.white),
      ),
      title: Text(
        services.title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),


      subtitle: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                child: LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                    value: services.indicatorValue,
                    valueColor: AlwaysStoppedAnimation(Colors.green)),
              )),
        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(services: services)));
      },
    );

    Card makeCard(Services services) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: makeListTile(services),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.green,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
        'KRCE'
        )
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Center(
            child: FloatingActionButton(

              child: Text('Action'),
              onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailChildPage(services: services )));
          },
      )
      )
    )
    );
  }
}
