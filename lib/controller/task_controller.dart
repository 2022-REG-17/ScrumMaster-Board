import 'package:ctse_frontend/colors/colors.dart';
import 'package:ctse_frontend/model/task_model.dart';
import 'package:ctse_frontend/service/task_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class TaskController extends GetxController {
  var TaskTask = List<Datum2>.empty(growable: true).obs;
  var page = 0;
  var size = 9;
  var isDataProcessing = false.obs;

  // For Pagination
  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = true.obs;

  // To Save Task
  TextEditingController tasknameEditingController;
  TextEditingController taskdesEditingController;
  TextEditingController taskstatusEditingController;
  TextEditingController taskmemEditingController;
  TextEditingController taskcommentEditingController;
  
  var isProcessing = false.obs;

  @override
  void onInit() {
    super.onInit();
    getMoreTask(page);
    paginateTask();
     // To Save  Task
    tasknameEditingController = TextEditingController();
    taskdesEditingController = TextEditingController();
    taskstatusEditingController = TextEditingController();
    taskmemEditingController = TextEditingController();
    taskcommentEditingController = TextEditingController();
  }

  Future<Task> getTasks(int page, int size) {
    return TaskService.getTasks(page, size);
  }

  // For Pagination
  void paginateTask() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("reached end");
        page++;
        getMoreTask(page);
      }
    });
  }

// Save Data
  void saveTask(Map data) {
    try {
      isProcessing(true);
      TaskService().saveTask(data).then((resp) {
        // ignore: unrelated_type_equality_checks
        if (resp == "success") {
          clearTextEditingControllers();
          isProcessing(false);
          showSnackBar("Add Task", "Failed to Add Task", Colors.red);
          TaskTask.clear();
          refreshList();
        } else {
          showSnackBar("Add Task", "Task Added", Colors.green);
        }
      }, onError: (err) {
        isProcessing(false);
        showSnackBar("", "Task Deleted", Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  // Update Data
  void updateTask(Map data, String id) {
    try {
      isProcessing(true);
      TaskService.updateTask(data, id).then((resp) {
        if(resp=="success") {
          clearTextEditingControllers();
          isProcessing(false);

          showSnackBar("Edit Task", "Task not Updated", Colors.red);
          TaskTask.clear();
          refreshList();
        }
        else
          {
            showSnackBar("Edit Task",  "Task Updated", Colors.green);
          }
      }, onError: (err) {
        isProcessing(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  //delete data
  void deleteTask(String id) {
    try {
      isProcessing(true);
      TaskService().deleteTask(id).then((resp) {
        isProcessing(false);
        if (resp == "success") {
          showSnackBar("Delete Task", "Task Deleted", Colors.green);
          TaskTask.clear();
          refreshList();
        } else {
          showSnackBar("Delete Task", "Task not Deleted", Colors.red);
        }
      }, onError: (err) {
        isProcessing(false);
        showSnackBar("", "Task Deleted", Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }
  
  // Get More data
  void getMoreTask(var page) {
    try {
      getTasks(page, size).then((resp) {
        if (resp != null) {
          TaskTask.addAll(resp.data);
          print("Service length : " + TaskTask.length.toString());
          isMoreDataAvailable(true);
        } else {
          isMoreDataAvailable(false);
          showSnackBar("Message", "No more items", Colors.black);
        }
      }, onError: (err) {
        isMoreDataAvailable(false);
        showSnackBar("Error", err.toString(), colors.green1);
      });
    } catch (exception) {
      isMoreDataAvailable(false);
      showSnackBar("Exception", exception.toString(), colors.green1);
    }
  }

  // common snack bar
  showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }

  // Refresh List
  void refreshList() async {
    page = 0;
    getTasks(page, size);
  }
  // clear the controllers
  void clearTextEditingControllers() {
    tasknameEditingController.clear();
    taskdesEditingController.clear();
    taskstatusEditingController.clear();
    taskmemEditingController.clear();
    taskcommentEditingController.clear();
  }
  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
    tasknameEditingController.dispose();
    taskdesEditingController.dispose();
    taskstatusEditingController.dispose();
    taskmemEditingController.dispose();
    taskcommentEditingController.dispose();
  }
}
