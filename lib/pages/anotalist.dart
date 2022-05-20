import 'package:app_anotacoes/models/anota.dart';
import 'package:flutter/material.dart';

class AnotaList extends StatelessWidget {
  const AnotaList(this.anota, this.onDelete, {Key? key}) : super(key: key);

  final List<Anota> anota;

  final void Function(String) onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: anota.map((an) {
        return Card(
          elevation: 5,
          child: ListTile(
            leading: const FlutterLogo(),
            title: Text(an.title),
            subtitle: Text(an.subtitle),
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                  ),
                  iconSize: 20,
                ),
                IconButton(
                  onPressed: () => onDelete(an.id),
                  icon: const Icon(
                    Icons.delete,
                  ),
                  color: Theme.of(context).errorColor,
                  iconSize: 20,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
