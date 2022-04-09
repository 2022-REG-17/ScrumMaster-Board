import 'package:ctse_frontend/colors/colors.dart';
import 'package:ctse_frontend/model/project_model.dart';
import 'package:ctse_frontend/service/project_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class ProjectController extends GetxController {
  var ProjectTask = List<Datum>.empty(growable: true).obs;
  var page = 0;
  var size = 9;
  var isDataProcessing = false.obs;

  // For Pagination
  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = true.obs;

  // To Save Task
  TextEditingController pronameEditingController;
  TextEditingController dateEditingController;
  TextEditingController adminEditingController;
  TextEditingController memberEditingController;

  var isProcessing = false.obs;

  @override
  void onInit() {
    super.onInit();
    getMoreProject(page);
    paginateProject();
    // To Save  Task
    pronameEditingController = TextEditingController();
    dateEditingController = TextEditingController();
    adminEditingController = TextEditingController();
    memberEditingController = TextEditingController();
  }

  Future<Project> getProjects(int page, int size) {
    return ProjectService.getProjects(page, size);
  }

  // For Pagination
  void paginateProject() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("reached end");
        page++;
        getMoreProject(page);
      }
    });
  }

// Save Data
  void saveProject(Map data) {
    try {
      isProcessing(true);
      ProjectService().saveProject(data).then((resp) {
        // ignore: unrelated_type_equality_checks
        if (resp == "success") {
          clearTextEditingControllers();
          isProcessing(false);
          showSnackBar("Add Project", "Failed to Add Project", Colors.red);
          ProjectTask.clear();
          refreshList();
        } else {
          showSnackBar("Add Project", "Project Added", Colors.green);
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

  // Update Data
  void updateProject(Map data, String id) {
    try {
      isProcessing(true);
      ProjectService.updateProject(data, id).then((resp) {
        if (resp == "success") {
          clearTextEditingControllers();
          isProcessing(false);

          showSnackBar("Edit Project", "Project not Updated", Colors.red);
          ProjectTask.clear();
          refreshList();
        } else {
          showSnackBar("Edit Project", "Project Updated", Colors.green);
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

  // Get More data
  void getMoreProject(var page) {
    try {
      getProjects(page, size).then((resp) {
        if (resp != null) {
          ProjectTask.addAll(resp.data);
          print("Service length : " + ProjectTask.length.toString());
          isMoreDataAvailable(true);
        } else {
          isMoreDataAvailable(false);
          showSnackBar("Message", "No more projects", Colors.black);
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

  //delete data
  void deleteProject(String id) {
    try {
      isProcessing(true);
      ProjectService().deleteProject(id).then((resp) {
        isProcessing(false);
        if (resp == "success") {
          showSnackBar("Delete Project", "Project not Deleted", Colors.red);
          ProjectTask.clear();
          refreshList();
        } else {
          showSnackBar("Delete Project", "Project Deleted", Colors.green);
        }
      }, onError: (err) {
        isProcessing(false);
        showSnackBar("", "Project Deleted", Colors.green);
      });
    } catch (exception) {
      isProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
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
  void refreshList() {
    page = 0;
    getProjects(page, size);
  }

  // clear the controllers
  void clearTextEditingControllers() {
    pronameEditingController.clear();
    dateEditingController.clear();
    adminEditingController.clear();
    memberEditingController.clear();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
    pronameEditingController.dispose();
    dateEditingController.dispose();
    adminEditingController.dispose();
    memberEditingController.dispose();
  }
}
