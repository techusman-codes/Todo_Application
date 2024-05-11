// ignore: unused_import
import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

List<Todo> _todos = [
  const Todo('Task One', 'take Out trash'),
  const Todo('Task One', 'take Out trash'),
];

void main() {
  runApp(MaterialApp(
    title: 'app',
    home: TodosScreen(todos: _todos),
  ));
}

// Part Two
// Setting Up Todo Screen StatefluWidget
// Todo Screen State >> Floating Action Button
// >>ListViewbuilder

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key, required this.todos}) : super(key: key);

  final List<Todo> Todos;

  @override
  _TodosScreenState createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Task'),
      ),
      body: ListView.builder(
          itemCount: _todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_todos[index].title),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(todo: _todos[index]),
                    ));
              },
            );
          }),
      // to setUp our Floating ActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Todo? newTodo = await showDialog<Todo>(
              context: context,
              builder: (BuildContext context) {
                String? title;
                String? description;

                return AlertDialog(
                  title: const Text('Create New Task'),
                  content: Column(
                    children: <Widget>[
                        TextField(
                          onChanged: (value) => title = value,
                          decoration: const InputDecoration(labelText: 'Title'),
                        )
                    ],
                  ),
                );
              });
        },
      ),
      // LIST VIEW--> button --> update list --> list view, build
      // every ListTile ---> detail Screen
    );
  }
}

// DetailsScreen
// FloatingAction Button
// takes in a single Todo object, display, title, description
