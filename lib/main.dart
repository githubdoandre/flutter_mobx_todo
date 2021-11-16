import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_start/models/todo_model.dart';
import 'package:flutter_mobx_start/stores/todo_store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final todoStore = TodoStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (context) => Text(todoStore.todos.length.toString()),
        ),
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: todoStore.todos.length,
          itemBuilder: (c, i) => ListTile(
            trailing: IconButton(
                onPressed: () => todoStore.remove(todoStore.todos[i]),
                icon: const Icon(Icons.delete)),
            title: Text(
              todoStore.todos[i].title.toString(),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => todoStore.add(
          Todo(id: 1, title: 'todo ${todoStore.todos.length + 1}'),
        ),
      ),
    );
  }
}
