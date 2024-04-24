import 'package:flutter/material.dart';
import 'package:flutter_todo/src/view_models/todo_viewmodel.dart';
import 'package:provider/provider.dart';

class ToDoEdit extends StatefulWidget {
  final tododata;
  const ToDoEdit({super.key, required this.tododata});
  @override
  State<ToDoEdit> createState() => _ToDoEditState();
}

class _ToDoEditState extends State<ToDoEdit> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final todocontroller = Provider.of<ToDoViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('ToDo Edit'),
      ),
      body: Form(
        key: formKey,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 400,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: todocontroller.nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.red),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Name",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 400,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: todocontroller.ageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.red),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Age",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => {
                  if (formKey.currentState!.validate())
                    {
                      todocontroller.editToDo(widget.tododata.sId),
                    }
                },
                child: Container(
                  width: 400,
                  height: 55,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
