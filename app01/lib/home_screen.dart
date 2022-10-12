import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const colorFondoAppBar = Color(0xff13171D);
  static const colorSombraAppBar = Color.fromARGB(255, 18, 136, 240);
  static const colorFondoScaffold = Color(0xffffffff);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zape Grupal !!"),
        backgroundColor: colorFondoAppBar,
        shadowColor: colorSombraAppBar,
        titleTextStyle: const TextStyle(color: colorSombraAppBar, fontSize: 30),
        leading: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Image.asset(
              "image/Tabuenito.jpg",
            )),
      ),
      backgroundColor: colorFondoScaffold,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Text("Veces que clickeaste:",
                style: TextStyle(color: Colors.red, fontSize: 35)),
            Text("0", style: TextStyle(color: Colors.red, fontSize: 35))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            print("Hola Cracks !!");
          }),
    );
  }
}
