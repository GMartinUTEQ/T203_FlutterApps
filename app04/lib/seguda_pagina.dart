import 'package:app04/main.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class SegundaPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Segunda ruta")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Regresar a Home")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/TerceraPagina");
                  },
                  child: const Text("Ir a 3ra pantalla")),
            ],
          ),
        ));
  }
}
