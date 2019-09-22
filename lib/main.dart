import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.cyanAccent,
        padding: const EdgeInsets.only(top: 40.0),
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Icon(
                  Icons.directions_bus,
                  color: Colors.blue,
                  size: 30.0,
                ),
                new Text(
                  "TickestFast",
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.blue,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
            ),
            new Text(
              "Login\n",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            new Card(
              child: new Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10.0),
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      decoration: new InputDecoration(labelText: "Usuario"),
                    ),
                    new TextField(
                      decoration: new InputDecoration(labelText: "Contraseña"),
                    ),
                    const SizedBox(height: 30),
                    new RaisedButton(
                      onPressed: () {},
                      textColor: Colors.white,
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: const Text('Entrar',
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            new Text("\n Entra con:"),
            new Container(
              child: new Column(
                children: <Widget>[
                  new Center(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new IconButton(
                          icon: new Icon(
                            FontAwesomeIcons.google,
                          ),
                          color: Colors.redAccent,
                          onPressed: () {},
                        ),
                        new IconButton(
                          icon: new Icon(FontAwesomeIcons.facebook),
                          color: Colors.blueAccent,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                  ),
                  new FlatButton(
                    child: new Text("¿No se ha registrado? Registrese Aqui"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new registro()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class registro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Registro"),
        backgroundColor: Colors.blueAccent,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Text(
              "\nRegistrece ",
              style: TextStyle(fontSize: 20.0),
            ),
            new TextField(
              decoration: new InputDecoration(labelText: "Nombre Completo"),
            ),
            new TextField(
              decoration: new InputDecoration(labelText: "Usuario"),
            ),
            new TextField(
              decoration: new InputDecoration(labelText: "Contraseña"),
            ),
            new Text(
              "\nO con Redes Sociales",
              style: TextStyle(fontSize: 20.0),
            ),
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(
                      FontAwesomeIcons.google,
                    ),
                    color: Colors.redAccent,
                    onPressed: () {},
                  ),
                  new IconButton(
                    icon: new Icon(FontAwesomeIcons.facebook),
                    color: Colors.blueAccent,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            new Text(
              "\nImportante: ",
              style: TextStyle(fontSize: 20.0),
            ),
            new TextField(
              decoration:
                  new InputDecoration(labelText: "Codigo del Administrador"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: new Icon(FontAwesomeIcons.plus),
        onPressed: () {},
      ),
    );
  }
}
