// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_todo/helpers/navigator.dart';
import 'package:flutter_todo/helpers/network.dart';
import 'package:flutter_todo/src/models/user_model.dart';
import 'package:flutter_todo/src/views/todo_create.dart';
import 'package:flutter_todo/src/views/todo_edit.dart';
import 'package:flutter_todo/src/views/todo_list.dart';

class ToDoViewModel extends ChangeNotifier {
  final NavigationService _navigationService;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  List<UserModel> users = [];

  ToDoViewModel(this._navigationService) {
    getAllUsers();
  }

  navigateToCreate() {
    nameController.clear();
    ageController.clear();
    majorController.clear();
    addressController.clear();
    phoneController.clear();
    emailController.clear();
    _navigationService.navigate(const ToDoCreate());
  }

  navigateToInfor(UserModel user) {
    nameController.text = user.name.toString();
    ageController.text = user.age.toString();
    majorController.text = user.major.toString();
    addressController.text = user.address.toString();
    phoneController.text = user.phone.toString();
    emailController.text = user.email.toString();
    _navigationService.navigate(ToDoEdit(tododata: user));
  }

  getAllUsers() async {
    _navigationService.showLoader();
    try {
      final resData = await ApiProvinder().get("/todo-app");
      users = resData.map<UserModel>((e) => UserModel.fromJson(e)).toList();
      _navigationService.goback();
      notifyListeners();
    } catch (e) {
      _navigationService.goback();
    }
  }

  createTodo() async {
    _navigationService.showLoader();
    var resData = await ApiProvinder().post("/todo-app", {
      "name": nameController.text,
      "age": ageController.text,
      "major": majorController.text,
      "address": addressController.text,
      "phone": phoneController.text,
      "email": emailController.text,
    });
    if (resData) {
      getAllUsers();
      _navigationService.goback();
      _navigationService.navigate(const ToDoList());
      nameController.clear();
      ageController.clear();
      majorController.clear();
      addressController.clear();
      phoneController.clear();
      emailController.clear();
    }
  }

  editToDo(id) async {
    _navigationService.showLoader();
    var resData = await ApiProvinder().put("/todo-app/$id", {
      "name": nameController.text,
      "age": ageController.text,
      "major": majorController.text,
      "address": addressController.text,
      "phone": phoneController.text,
      "email": emailController.text,
    });
    if (resData) {
      getAllUsers();
      _navigationService.goback();
      _navigationService.navigate(const ToDoList());
      nameController.clear();
      ageController.clear();
      majorController.clear();
      addressController.clear();
      phoneController.clear();
      emailController.clear();
    }
  }

  deleteToDo(id, index) async {
    _navigationService.showLoader();
    var resData = await ApiProvinder().delete("/todo-app/$id");
    _navigationService.goback();
    if (resData) {
      users.removeAt(index);
      notifyListeners();
    } else {
      // print("Error deleting user");
    }
  }
}
