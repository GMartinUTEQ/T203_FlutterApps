import 'package:app02/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi tiendita"),
        elevation: 0,
      ),
      body: Column(
        children: const [CardSwiper()],
      ),
    );
  }
}
