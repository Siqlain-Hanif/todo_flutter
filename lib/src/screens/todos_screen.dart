import 'package:flutter/material.dart';
import 'package:todo_app/src/repositories/todo_repo.dart';
import 'package:todo_app/src/utils/navigator_helper.dart';
import 'package:todo_app/src/widgets/no_data_card.dart';
import 'package:todo_app/src/widgets/todo_tile.dart';

class TodosScreen extends StatelessWidget {
  static const String routeName = '/todos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //opens in create mode
          NavigatorHelper().navigateToTodoCreateEditScreen();
        },
      ),
      body: StreamBuilder<List<int>>(
        stream: todoRepo.todoList$,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data.length == 0)
            return NoDataCard(
              text:
                  "Add your first todo by clicking on the + icon at bottom right",
              title: "Nada",
            );

          final todos = snapshot.data;
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) => TodoTile(todos[index]),
            itemCount: todos.length,
          );
        },
      ),
    );
  }
}
