import 'package:flutter_mobx_start/models/todo_model.dart';
import 'package:mobx/mobx.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  @observable
  var todos = ObservableList<Todo>();

  @action
  void add(Todo todo) {
    todos.add(todo);
  }

  @action
  void remove(Todo todo) {
    todos.remove(todo);
  }
}
