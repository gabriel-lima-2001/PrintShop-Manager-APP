import 'package:flutter/material.dart';

import './contatos.dart';
import './main.dart';
import './orcamento.dart';
void main() {
  runApp(Sobre());
}

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('Sobre'),
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
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "img/devmachinelogo.png",
          height: 200,
          ),
          new Divider(
              color: Colors.black,
              height: 5.0,
            ),
        Image.asset(
          "img/printshoplogo.png",
          height: 200,
          ),
          new Divider(
              color: Colors.black,
              height: 5.0,
            ),
          Text('PrintShop Manager® e seus logotipos são propriedade da DevMachine®',
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
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

