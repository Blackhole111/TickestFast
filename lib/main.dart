import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticket_pass_package/dash_separator.dart';
import 'package:ticket_pass_package/ticket_pass.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';


void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  String user;
  String contrasena;

  final TextEditingController controller = new TextEditingController();
  final TextEditingController controller1 = new TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.cyanAccent,
        padding: const EdgeInsets.only(top: 40.0),
        child: new ListView(
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
              textAlign: TextAlign.center,
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
                      decoration: new InputDecoration(
                          labelText: "Usuario",
                          icon: Icon(Icons.account_circle)),
                      onChanged: (String valor) {
                        user = valor;
                      },
                      controller: controller,
                    ),
                    new TextField(
                      decoration: new InputDecoration(
                          labelText: "Contraseña", icon: Icon(Icons.lock)),
                      onChanged: (String valor) {
                        contrasena = valor;
                      },
                      obscureText: true,
                      controller: controller1,
                    ),
                    const SizedBox(height: 30),
                    new RaisedButton(
                      onPressed: () {
                        if (user == 'admin' && contrasena == '1234'){
                          Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new administrador()));
                        }
                        else{
                          login(context);
                        }
                      },
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
            new Container(
              child: new Column(
                children: <Widget>[
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

  login(BuildContext context) async {
    FirebaseUser user;
    try {
      user = (await _auth.signInWithEmailAndPassword(
          email: controller.text, password: controller1.text)).user;
    } catch (e) {
      print(e.toString());
    } finally {
      if (user != null) {
        // sign in successful!
        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new usuario()));
      } else {
        // sign in unsuccessful
        print('sign in Not');
        // ex: prompt the user to try again
      }
    

    contrasena = "";
    controller.text = "";
    controller1.text = "";
  }
  }
}

class registro extends StatelessWidget {
  final _nameController = TextEditingController();
  final _correoController = TextEditingController();
  final _passController = TextEditingController();
  final _cpassController = TextEditingController();
  final _codController = TextEditingController();

  final FirebaseAuth _auth =FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Registro"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: "Nombre Completo"),
              controller: _nameController,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Correo Electronico"),
              controller: _correoController,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Contraseña"),
              controller: _passController,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Repetir Contraseña"),
              controller: _cpassController,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Codigo del administrador"),
              controller: _codController,
            ),
            RaisedButton(
              onPressed: () {register();},
              child: Text("Registrarse"),
            )
          ],
        ),
    );
  }
  register() async {
    if(true){
      final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: _correoController.text,
      password: _passController.text,
    )).user;
    /*if (user != null) {
      print("Se realizo perfectamente");
    } else {
      print("Vuelva a intentarlo");
    }*/

    }
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
      child: ListView(
        children: <Widget>[
          item("Eddy", "7:00 PM", "Vega-Bonao"),
          item("Alberto", "8:00 PM", "Bonao-Vega"),
          item("Alberto", "10:00 PM", "Vega-Bonao"),
        ],
      ),
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
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Destino',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                  Text(
                                    'Bonao-Vega',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Fecha',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                Text(
                                  DateFormat.yMMMMd().format(DateTime.now()),
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Precio',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                Text(
                                  'RD\$70 ',
                                  style: TextStyle(fontWeight: FontWeight.w600),
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

class administrador extends StatefulWidget {
  @override
  _administradorState createState() => _administradorState();
}

class _administradorState extends State<administrador>
    with SingleTickerProviderStateMixin {
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
        title: Text("Administrador"),
      ),
      body: TabBarView(
        children: <Widget>[new registroTicket(), new detalles()],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        color: Colors.blueAccent,
        child: TabBar(
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.folder),
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.archive),
            ),
          ],
          controller: controller,
        ),
      ),
    );
  }
}

// listas para la parte de administrador, y puede servir para usuario

List<String> choferlist = <String>[
  'Alberto',
  'Eddy',
];

List<String> horalist = <String>[
  '1:00 PM',
  '3:00 PM',
  '5:00 PM',
  '6:00 PM',
  '7:00 PM',
  '8:00 PM',
  '9:00 PM',
  '10:00 PM',
];

List<String> destinolist = <String>[
  'Vega-Bonao',
  'Bonao-Vega',
];

//Se termina declarar listas

class registroTicket extends StatefulWidget {
  @override
  _registroTicketState createState() => new _registroTicketState();
}

class _registroTicketState extends State<registroTicket> {
  String opcion1;
  String opcion2;
  String opcion3;

  List listas = [
    ["Alberto", "7:00 PM", "Vega-Bonao"],
    ["Eddy", "8:00 PM", "Vega-Bonao"],
  ];

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Chofer:"),
            trailing: DropdownButton<String>(
              value: opcion1,
              hint: Text("elije"),
              onChanged: (String valor) {
                setState(() {
                  opcion1 = valor;
                });
              },
              items: choferlist.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text("Hora:"),
            trailing: DropdownButton<String>(
              value: opcion2,
              hint: Text("elije"),
              onChanged: (String valor) {
                setState(() {
                  opcion2 = valor;
                });
              },
              items: horalist.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text("Ruta:"),
            trailing: DropdownButton<String>(
              value: opcion3,
              hint: Text("elije"),
              onChanged: (String valor) {
                setState(() {
                  opcion3 = valor;
                });
              },
              items: destinolist.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          RaisedButton(
            child: Text("Guardar"),
            onPressed: () {
              setState(() {
                listas.add([opcion1, opcion2, opcion3]);
              });
            },
          ),
          Text(
            "Tickets Guardados",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0),
          ),
          Text(
            "Para borrar un horario pulse",
            textAlign: TextAlign.center,
          ),
          Column(
            children: listaitem(),
          ),
        ],
      ),
    );
  }

  List<Widget> listaitem() {
    int a = listas.length;
    List<Widget> items = List<Widget>();

    for (int e = 0; e < a; e++) {
      items.add(ListTile(
        title: Text("Hora de salida: ${listas[e][1]}"),
        subtitle: Text("Chofer: ${listas[e][0]} \nDestino: ${listas[e][2]}"),
        leading: Icon(Icons.directions),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          setState(() {
            listas.removeAt(e);
          });
        },
      ));
    }
    return items;
  }
}

class detalles extends StatefulWidget {
  @override
  _detallesState createState() => new _detallesState();
}

class _detallesState extends State<detalles> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                Text(
                  "Choferes",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                ),
                TextField(
                  decoration:
                      InputDecoration(hintText: "Inserte el nombre del Chofer"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.0),
                ),
                Column(
                  children: <Widget>[],
                )
              ],
            ),
          ),
          Divider(
            color: Colors.blueAccent,
            thickness: 5.0,
          ),
          Card(
            child: Column(
              children: <Widget>[
                Text(
                  "Horario",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Inserte el horario"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.0),
                ),
                Column(
                  children: <Widget>[],
                )
              ],
            ),
          ),
          Divider(
            color: Colors.blueAccent,
            thickness: 5.0,
          ),
          Card(
            child: Column(
              children: <Widget>[
                Text(
                  "Ruta",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Inserte la ruta"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.0),
                ),
                Column(
                  children: <Widget>[],
                )
              ],
            ),
          ),
          Divider(
            color: Colors.blueAccent,
            thickness: 5.0,
          ),
          Card(
            child: Column(
              children: <Widget>[
                Text(
                  "Precio",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Inserte el precio"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.0),
                ),
                Text(
                  "Precio: RD\$70.00 Pesos",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.blueAccent,
            thickness: 5.0,
          ),
          Card(
            child: Column(
              children: <Widget>[
                Text(
                  "Codigo",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Inserte el Codigo"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.0),
                ),
                Text(
                  "Codigo: 8020",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
