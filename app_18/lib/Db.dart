import 'Task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  getDatabase() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco-tasks.db");

    var database = await openDatabase(localBancoDados, version: 1,
        onCreate: (db, dbVersaoRecente) {
      String sql =
          "CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR) ";
      db.execute(sql);
    });

    return database;
  }

  getAllTasks() async {
    Database bd = await this.getDatabase();

    String sql = "SELECT * FROM tasks";
    List tasksDb = await bd.rawQuery(sql);
    List<Task> tasks = [];

    for (var task in tasksDb) {
      tasks.add(Task(task["id"], task["title"]));
    }

    return tasks;
  }

  saveTask(task) async {
    if (task.isNotEmpty) {
      Database bd = await this.getDatabase();

      Map<String, dynamic> dadosTask = {
        "title": "$task",
      };
      return await bd.insert("tasks", dadosTask);
    }
  }

  deleteTask(id) async {
    if (id != null) {
      Database bd = await this.getDatabase();
      return await bd.rawQuery("DELETE FROM  tasks where id = $id");
    }
  }
}
