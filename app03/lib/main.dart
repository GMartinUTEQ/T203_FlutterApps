import 'package:app03/segundapagina.dart';
import 'package:flutter/material.dart';

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

class PrimeraRuta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Primera Ruta"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              /*Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SegundaPagina()));*/
              Navigator.pushNamed(context, "/SegundaPagina");
            },
            child: const Text("Ir a página 2"),
          ),
        ));
  }
}
