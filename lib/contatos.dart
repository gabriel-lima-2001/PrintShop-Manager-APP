import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import './sobre.dart';
import './main.dart';

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
abrirGooglemaps() async {
  const urlMap =
  "https://www.google.com/maps/place/Fatec+Ferraz+De+Vasconcelos+Etec+Ferraz+de+Vasconcelos/@-23.5323581,-46.3723194,17z/data=!3m1!4b1!4m5!3m4!1s0x94ce64d668189057:0x83b22ceb878987dd!8m2!3d-23.5323581!4d-46.3701307";
  if (await canLaunch(urlMap)) {
    await launch(urlMap);
  } else {
    throw 'Could not launch Maps';
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
          leading: Icon(Icons.email),
          title: new Text('E-Mail: suporte@printshopmanager.com.br'),
          ),
          new Divider(
              color: Colors.white,
              height: 20.0,
            ),
          new ListTile(
          leading: Icon(Icons.location_on),
          title: new Text('Endereço: Rua Carlos de Carvalho, 200, Ferraz de Vasconcelos - SP, 08545-160'),
          ),
          new Divider(
              color: Colors.white,
              height: 20.0,
            ),
          new ListTile(
              leading: Icon(Icons.map,
              color: Colors.white,),
              title: new Text('Localização no Google Maps',
              style: TextStyle(color: Colors.white),),
              tileColor: Colors.blueAccent,
              onTap: () {
               abrirGooglemaps();
              },
            ),
      ],
    );
  }
}

