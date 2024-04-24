import 'package:flutter/material.dart';
import 'package:flutter_todo/src/view_models/todo_viewmodel.dart';
import 'package:provider/provider.dart';

class ToDoCreate extends StatefulWidget {
  const ToDoCreate({super.key});

  @override
  State<ToDoCreate> createState() => _ToDoCreateState();
}

class _ToDoCreateState extends State<ToDoCreate> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final todocontroller = Provider.of<ToDoViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.blue.shade500,
      appBar: AppBar(
        title: const Text('Create To Do'),
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
                  style: const TextStyle(color: Colors.black),
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
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Age",
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
                  controller: todocontroller.majorController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Major",
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
                  controller: todocontroller.emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Email",
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
                  controller: todocontroller.phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Phone",
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
                  controller: todocontroller.addressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required field';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Address",
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
                      todocontroller.createTodo(),
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
                          color: Colors.black, fontWeight: FontWeight.bold),
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
