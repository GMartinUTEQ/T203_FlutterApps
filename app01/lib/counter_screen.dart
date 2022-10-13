import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  static const colorFondoAppBar = Color(0xff13171D);
  static const colorSombraAppBar = Color.fromARGB(255, 18, 136, 240);
  static const colorFondoScaffold = Color(0xffffffff);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
        backgroundColor: CounterScreen.colorFondoAppBar,
        shadowColor: CounterScreen.colorSombraAppBar,
        titleTextStyle: const TextStyle(
            color: CounterScreen.colorSombraAppBar, fontSize: 30),
        leading: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Image.asset(
              "image/Tabuenito.jpg",
            )),
      ),
      backgroundColor: CounterScreen.colorFondoScaffold,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("Veces que clickeaste:",
                style: TextStyle(color: Colors.red, fontSize: 35)),
            Text(contador.toString(),
                style: const TextStyle(color: Colors.red, fontSize: 35))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          //child: const Text("Reset"),
          child: const Icon(Icons.add),
          onPressed: () {
            contador++;
            print(contador);
            setState(() {});
          }),
    );
  }
}
