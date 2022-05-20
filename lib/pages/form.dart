import 'package:flutter/material.dart';

class FormButton extends StatefulWidget {
  const FormButton(this.onSubmit, {Key? key}) : super(key: key);

  final void Function(String, String) onSubmit;

  @override
  State<FormButton> createState() => _FormButtonState();
}

class _FormButtonState extends State<FormButton> {
  final titleControl = TextEditingController();

  final subtitleControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: titleControl,
          decoration: const InputDecoration(
              hintText: 'Coloque o Título aqui', border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: subtitleControl,
          decoration: const InputDecoration(
              hintText: 'Coloque o Subtítulo aqui',
              border: OutlineInputBorder()),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ElevatedButton(
              onPressed: () {
                final title = titleControl.text;
                final subtitle = subtitleControl.text;

                widget.onSubmit(title, subtitle);
              },
              child: const Text('Concluir')),
        )
      ],
    );
  }
}
