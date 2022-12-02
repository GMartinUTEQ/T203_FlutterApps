import 'dart:convert';
import 'package:app03/segundapagina.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

Future<bool> login(String correo, String pass) async {
  var url = Uri.https("grupojj.com.mx", 'WSLogin/Login.php');
  var map = <String, dynamic>{};
  map['apikey'] = 'UTEQ';
  map['usu'] = correo;
  map['pass'] = pass;

  http.Response response = await http.post(
    url,
    body: map,
  );

  Map<String, dynamic> data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    String Message = data["Message"];
    if (Message == "OK") {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

Future<void> _dialogError(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: const Text('Error, Usuario o contraseña incorrectos.'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: PrimeraRuta(),
      initialRoute: "/",
      routes: {
        "/": (context) => PrimeraRuta(),
        "/SegundaPagina": (context) => SegundaPagina(),
      },
    );
  }
}

class PrimeraRuta extends StatefulWidget {
  @override
  State<PrimeraRuta> createState() => _PrimeraRutaState();
}

class _PrimeraRutaState extends State<PrimeraRuta> {
  Future<bool?> showToast() {
    return Fluttertoast.showToast(
      msg: 'Bienvenido',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.blueAccent,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  final TextEditingController _correo = TextEditingController();
  final TextEditingController _contra = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Primera Ruta"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _correo,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contra,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (await login(_correo.text, _contra.text)) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SegundaPagina()));
                    showToast();
                    var snackBar = const SnackBar(content: Text('Bienvenido'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    _dialogError(context);
                  }
                  setState(() {});
                  //Navigator.pushNamed(context, "/SegundaPagina");
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ));
  }
}
