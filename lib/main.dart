import 'package:flutter/material.dart';

import './sobre.dart';
import './contatos.dart';
import './orcamento.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PrintShop Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'PrintShop Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Image.asset(
        "img/printshoplogo.png",
        fit: BoxFit.cover,
        height: 400,
        alignment: Alignment(0.0, 1.0),
        ), 
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new DrawerHeader(child: 
            Image.asset(
                      "img/printshoplogo.png",
                        fit: BoxFit.cover,
                        height: 100,),
            decoration: BoxDecoration(color: Colors.lightBlue),
            ),
             new ListTile(
              leading: Icon(Icons.home),
              title: new Text('Início'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                  builder: (BuildContext context) => new MyApp())
                );
              },
            ),
            new Divider(
              color: Colors.black,
              height: 5.0,
            ),
            new ListTile(
              leading: Icon(Icons.request_page),
              title: new Text('Orçamento'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                  builder: (BuildContext context) => new Orcamento())
                );
              },
            ),
            new Divider(
              color: Colors.black,
              height: 5.0,
            ),
            new ListTile(
              leading: Icon(Icons.call),
              title: new Text('Contatos'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                  builder: (BuildContext context) => new Contatos())
                );
              },
            ),
            new Divider(
              color: Colors.black,
              height: 5.0,
            ),
            new ListTile(
              leading: Icon(Icons.book),
              title: new Text('Sobre'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                  builder: (BuildContext context) => new Sobre())
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
