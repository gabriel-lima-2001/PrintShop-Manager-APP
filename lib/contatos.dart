import 'package:flutter/material.dart';

import './sobre.dart';

void main() {
  runApp(Contatos());
}

class Contatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('Contatos'),
        ),
        body: Center(
          child: MyWidget(),
        ),
        drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new DrawerHeader(child: 
            Image.asset(
                      "img/printshoplogo.png",
                        fit: BoxFit.cover,
                        height: 100,),
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
            ),
            new Divider(
              color: Colors.black,
              height: 5.0,
            ),
            new ListTile(
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
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Entre em contato conosco!',
        style: TextStyle(fontSize: 30),
        ),
          new Divider(
              color: Colors.white,
              height: 20.0,
            ),
        new ListTile(
          leading: Icon(Icons.call),
          title: new Text('Telefones: (11) 4656-5895/(11) 99978-5959'),
          ),
          new Divider(
              color: Colors.black,
              height: 20.0,
            ),
          new ListTile(
          leading: Icon(Icons.call),
          title: new Text('Telefones: (11) 4656-5895/(11) 99978-5959'),
          ),
          new Divider(
              color: Colors.white,
              height: 20.0,
            ),
          Text('PrintShop Manager App 0.5 Beta',
          style: TextStyle(fontSize: 15),
          )
      ],
    );
  }
}

