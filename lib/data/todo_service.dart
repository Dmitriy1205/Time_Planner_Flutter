import 'file:///C:/Users/user/AndroidStudioProjects/organizer_app/lib/data/repository.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/organizer_app/lib/data/todo.dart';

class TodoService {
  Repository _repository;

  TodoService() {
    _repository = Repository();
  }

  saveTodo(Todo todo) async {
    return await _repository.insertData('todos', todo.todoMap());
  }

  readTodos() async {
    return await _repository.readData('todos');
  }
}
