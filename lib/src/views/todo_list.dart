import 'package:flutter/material.dart';
import 'package:flutter_todo/src/view_models/todo_viewmodel.dart';
import 'package:provider/provider.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todocontroller = Provider.of<ToDoViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Center(child: Text('To Do List')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todocontroller.navigateToCreate();
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          ListView.builder(
              itemCount: todocontroller.users.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                      tileColor: Colors.white,
                      title: Text(todocontroller.users[index].name as String),
                      subtitle: Text(todocontroller.users[index].age as String),
                      trailing: PopupMenuButton(
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          const PopupMenuItem(
                              value: "edit", child: Text('Edit')),
                          const PopupMenuItem(
                              value: "delete", child: Text('Delete')),
                        ],
                        onSelected: (String value) => {
                          if (value == 'edit')
                            {
                              todocontroller
                                  .navigateToEdit(todocontroller.users[index])
                            }
                          else if (value == 'delete')
                            {
                              todocontroller.deleteToDo(
                                  todocontroller.users[index].sId as String,
                                  index)
                            }
                        },
                      )),
                );
              })
        ],
      ),
    );
  }
}
