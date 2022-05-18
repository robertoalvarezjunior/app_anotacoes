import 'package:app_anotacoes/models/anota.dart';
import 'package:flutter/material.dart';

class AnotaList extends StatelessWidget {
  const AnotaList(this.anota, {Key? key}) : super(key: key);

  final List<Anota> anota;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: anota.map((an) {
        return ListTile(
          leading: const FlutterLogo(),
          title: Text(an.title),
          subtitle: Text(an.subtitle),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
            color: Theme.of(context).errorColor,
          ),
        );
      }).toList(),
    );
  }
}
