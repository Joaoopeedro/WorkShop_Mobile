import 'package:flutter/material.dart';

class Boasvindas extends StatefulWidget {
  const Boasvindas({super.key});

  @override
  State<Boasvindas> createState() => _BoasvindasState();
}

class _BoasvindasState extends State<Boasvindas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bem Vindo(a)!"),
      ),
    );
  }
}