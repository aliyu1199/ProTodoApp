import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  const TodoFormWidget(
      {Key? key,
      this.title = '',
      this.description = '',
      required this.onChangedTitle,
      required this.onChangedDescription,
      required this.onSavedTodo})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTile(),
            buildDescription(),
            const SizedBox(height: 50),
            buildButton(),
          ],
        ),
      );
  Widget buildTile() => TextFormField(
        initialValue: title,
        maxLines: 1,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title == null) {
            return 'It cant be empty';
          }
          return null;
        },
        decoration:
            const InputDecoration(
                labelStyle: TextStyle(fontSize: 18,),
                border: UnderlineInputBorder(),
                labelText: 'Title'
            ),
      );
  Widget buildDescription () => TextFormField(
    initialValue: description,
    maxLines: 4,
    onChanged: onChangedDescription,
    decoration: InputDecoration(
      labelStyle: TextStyle(fontSize: 18,),
      border: UnderlineInputBorder(),
      labelText: 'Description',
    ),
  );

  Widget buildButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onSavedTodo,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
      ), child: Text('Save'),
    ),
  );
}
