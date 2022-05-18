import 'dart:math';

import 'package:app_anotacoes/models/anota.dart';
import 'package:app_anotacoes/pages/anotalist.dart';
import 'package:app_anotacoes/pages/form.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final anota = [
    Anota(id: '', title: 'Teste', subtitle: 'Tste'),
  ];

  _addAnota(String title, String subtitle) {
    final newAnota = Anota(
      id: Random().nextDouble().toString(),
      title: title,
      subtitle: subtitle,
    );

    setState(() {
      anota.add(newAnota);
    });

    Navigator.of(context).pop();
  }

  _openForm(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return FormButton(
            _addAnota,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anotações'),
        actions: [
          IconButton(
              onPressed: () => _openForm(context), icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              AnotaList(anota),
            ],
          ),
        ),
      ),
    );
  }
}
