import 'package:flutter/material.dart';
import 'package:flutter_todo/src/models/user_model.dart';
import 'package:flutter_todo/src/view_models/todo_viewmodel.dart';
import 'package:provider/provider.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  late List<UserModel> usersCurrent = [];
  late ToDoViewModel todocontroller;

  @override
  void initState() {
    super.initState();
    todocontroller = Provider.of<ToDoViewModel>(context, listen: false);
    _loadData();
  }

  void _loadData() async {
    await todocontroller.getAllUsers();
    search("");
  }

  void search(String value) {
    final usersChanged = todocontroller.users.where((element) {
      final name = element.name?.toLowerCase();
      final input = value.toLowerCase();
      return name!.contains(input);
    }).toList();
    setState(() {
      usersCurrent = usersChanged;
    });
    print("ddaay laf: ${usersCurrent.length}");
  }

  @override
  Widget build(BuildContext context) {
    final todocontroller = Provider.of<ToDoViewModel>(context);
    late List<UserModel> usersCurrent = todocontroller.users;
    return Scaffold(
      backgroundColor: Colors.blue.shade500,
      appBar: AppBar(
        title: const Center(child: Text('List Student HUMG')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todocontroller.navigateToCreate();
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.antiAlias,
                child: TextFormField(
                  onChanged: search,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search name student",
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                  itemCount: usersCurrent.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                          tileColor: Colors.white,
                          title: Text("Name:  ${usersCurrent[index].name}"),
                          subtitle: Text("Major: ${usersCurrent[index].major}"),
                          trailing: PopupMenuButton(
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              const PopupMenuItem(
                                  value: "infor",
                                  child: Row(
                                    children: [
                                      Text("Infor "),
                                      Icon(Icons.info)
                                    ],
                                  )),
                              const PopupMenuItem(
                                  value: "delete",
                                  child: Row(
                                    children: [
                                      Text('Delete'),
                                      Icon(Icons.delete),
                                    ],
                                  )),
                            ],
                            onSelected: (String value) => {
                              if (value == 'infor')
                                {
                                  todocontroller
                                      .navigateToInfor(usersCurrent[index])
                                }
                              else if (value == 'delete')
                                {
                                  todocontroller.deleteToDo(
                                      usersCurrent[index].sId as String, index)
                                }
                            },
                          )),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
