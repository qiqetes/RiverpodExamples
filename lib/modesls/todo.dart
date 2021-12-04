import 'package:uuid/uuid.dart';

class Todo {
  final String id;
  final String title;
  final String? description;
  final bool completed;

  Todo(this.title, {this.description, this.completed = false}) : id = const Uuid().v4();
}
