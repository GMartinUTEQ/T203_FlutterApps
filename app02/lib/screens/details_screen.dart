import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi tiendita"),
      ),
      body: const Center(
        child: Text("Vista detalle"),
      ),
    );
  }
}
