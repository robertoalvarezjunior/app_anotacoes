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
    Anota(id: '', title: 'teste', subtitle: 'Teste'),
  ];

  _addAnota(String title, String subtitle) {
    setState(() {
      final newAnota = Anota(
        id: Random().nextDouble().toString(),
        title: title,
        subtitle: subtitle,
      );
      anota.add(newAnota);
    });

    Navigator.of(context).pop();
  }

  _deleteAnota(String id) {
    setState(() {
      anota.removeWhere((an) => an.id == id);
    });
  }

  _openForm(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        constraints: const BoxConstraints(maxHeight: 550),
        context: context,
        builder: (ctx) {
          return SingleChildScrollView(
            padding: MediaQuery.of(context).viewInsets,
            child: FormButton(
              _addAnota,
            ),
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
            onPressed: () => _openForm(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              AnotaList(anota, _deleteAnota),
            ],
          ),
        ),
      ),
    );
  }
}
