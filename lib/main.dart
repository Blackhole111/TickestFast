import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticket_pass_package/dash_separator.dart';
import 'package:ticket_pass_package/ticket_pass.dart';
import 'package:intl/intl.dart';


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
                      onPressed: () {Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new usuario()));},
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



class usuario extends StatefulWidget {
  @override
  _usuarioState createState() => new _usuarioState();
}

class _usuarioState extends State<usuario> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Tickets"),
      ),
      body: TabBarView(
        children: <Widget>[new tickets(), new boleto()],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        color: Colors.blueAccent,
        child: TabBar(
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.directions_bus),
            ),
            Tab(
              icon: Icon(Icons.local_play),
            ),
          ],
        controller: controller,
        ),
      ),
    );
  }
}


class tickets extends StatefulWidget {
  @override
  _ticketsState createState() => _ticketsState();
}

class _ticketsState extends State<tickets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: <Widget>[
        item("Eddy", "7:00 PM", "Vega-Bonao"),
        item("Alberto", "8:00 PM", "Bonao-Vega"),
        item("Alberto", "10:00 PM", "Vega-Bonao"),
      ],),
    );
  }

  Widget item(String chofer, String horario, String destino) {
    return ListTile(
      title: Text("Hora de salida: $horario"),
      subtitle: Text("Chofer: $chofer \nDestino: $destino"),
      leading: Icon(Icons.directions),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {},
    );
  }

}


class boleto extends StatefulWidget {
  @override
  _boletoState createState() => _boletoState();
}

class _boletoState extends State<boleto> {
  
  List<String> samples = <String>[
    'Asiento: 10',
    'Hora de Salida: 7:00 PM',
  ];

  final f = new DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Center(
          child: TicketPass(
              alignment: Alignment.center,
              animationDuration: Duration(seconds: 2),
              expandedHeight: 600,
              expandIcon: CircleAvatar(
                maxRadius: 14,
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              expansionTitle: Text(
                'Su número y horario:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              purchaserList: samples,
              separatorColor: Colors.black,
              separatorHeight: 2.0,
              color: Colors.white,
              curve: Curves.easeOut,
              titleColor: Colors.blue,
              shrinkIcon: Align(
                alignment: Alignment.centerRight,
                child: CircleAvatar(
                  maxRadius: 14,
                  child: Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              ticketTitle: Text(
                'Número de Ticket',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              titleHeight: 50,
              width: 350,
              height: 220,
              shadowColor: Colors.blue.withOpacity(0.5),
              elevation: 8,
              shouldExpand: true,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
                child: Container(
                  height: 140,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Destino',
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5)),
                                      ),
                                      Text(
                                        'Bonao-Vega',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Chofer',
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                      Text(
                                        'Alberto',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Fecha',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5)),
                                    ),
                                    Text(
                                      DateFormat.yMMMMd().format(DateTime.now()),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Precio',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5)),
                                    ),
                                    Text(
                                      'RD\$70 ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        );
  }
}
