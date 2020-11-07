import 'package:flutter/material.dart';

import './sobre.dart';
import './contatos.dart';
import './main.dart';
void main() async {
  runApp(
    MaterialApp(
      home: Orcamento(),
      theme: ThemeData(
        hintColor: Colors.blue,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          hintStyle: TextStyle(color: Colors.lightBlueAccent),
        ),
      ),
    ),
  );
}

class Orcamento extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Orcamento> {
  final cartaovisitaController = TextEditingController();
  final flyerController = TextEditingController();
  final cartazController = TextEditingController();
  final folderController = TextEditingController();
  final adesivoController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _mensagem = "";

  int cartaovisita = 0;
  int flyer = 0;
  int cartaz = 0;
  int folder = 0;
  int adesivo = 0;

  _orcamentoresultado() {
    setState(() {
      cartaovisita = int.parse(cartaovisitaController.text);
      flyer = int.parse(flyerController.text);
      cartaz = int.parse(cartazController.text);
      folder = int.parse(folderController.text);
      adesivo = int.parse(adesivoController.text);

      double valor = cartaovisita * 0.02 + flyer * 27.80 + cartaz * 18.90 + folder * 27.80 + adesivo * 7.62;
      _mensagem = "Valor Total: R\$ ${valor.toString()}";
      cartaovisitaController.clear();
      flyerController.clear();
      cartazController.clear();
      folderController.clear();
      adesivoController.clear();

    });
  }

  void _limpaCampos() {
    cartaovisitaController.clear();
    flyerController.clear();
    cartazController.clear();
    folderController.clear();
    adesivoController.clear();

    setState(() {
      _mensagem = "Informe seus dados!";
      _formKey = GlobalKey<FormState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Orçamento"),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _limpaCampos,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('img/cartaovisita.jpg'),
              construirTextField("Cartão de Visita", "Qtde:", cartaovisitaController, 
              "Favor Insira a qtde. cartões de visita"),
              Divider(),
              Image.asset('img/flyer.jpg'),
              construirTextField("Flyer", "Qtde:", flyerController,
              "Favor Insira a qtde. flyers"),
              Divider(),
              Image.asset('img/cartaz.jpg'),
              construirTextField("Cartaz", "Qtde:", cartazController,
              "Favor Insira a qtde. cartazes"),
              Divider(),
              Image.asset('img/folder.jpg'),
              construirTextField("Folder", "Qtde:", folderController,
              "Favor Insira a qtde. folders"),
              Divider(),
              Image.asset('img/adesivo.jpg'),
              construirTextField("Adesivos", "Qtde:", adesivoController,
              "Favor Insira a qtde. cartões"),
              Padding(
                padding: EdgeInsets.all(20),
                child: FlatButton(
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _orcamentoresultado();
                    }
                  },
                ),
              ),
              Center(
                child: Text(
                  _mensagem,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                  ),
                ),
              ) //
            ],
          ),
        ),
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
    //);
  }
}

Widget construirTextField(String texto, String prefixo, TextEditingController c,  String mensagemErro) {
  return TextFormField(
    controller: c,
    decoration: InputDecoration(
      labelText: texto,
      labelStyle: TextStyle(color: Colors.blue),
      border: OutlineInputBorder(),
      prefixText: prefixo,
    ),
    style: TextStyle(
      color: Colors.black,
      fontSize: 25,
    ),
    keyboardType: TextInputType.number,
     validator: (value) {
      if (value.isEmpty) {
        return mensagemErro;
      } else {
        return null;
      }
    },
  );
}