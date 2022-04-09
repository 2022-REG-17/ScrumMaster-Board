import 'package:ctse_frontend/colors/colors.dart';
import 'package:ctse_frontend/model/sprint_model.dart';
import 'package:ctse_frontend/service/sprint_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SprintController extends GetxController {
  var SprintTask = List<Datum1>.empty(growable: true).obs;
  var page = 0;
  var size = 9;
  var isDataProcessing = false.obs;

  // For Pagination
  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = true.obs;

  // To Save Task
  TextEditingController sprintnameEditingController;
  TextEditingController startdateEditingController;
  TextEditingController duedateEditingController;
  
  
  var isProcessing = false.obs;

  @override
  void onInit() {
    super.onInit();
    getMoreSprint(page);
    paginateSprint();
     // To Save  Task
    sprintnameEditingController = TextEditingController();
    startdateEditingController = TextEditingController();
    duedateEditingController = TextEditingController();
    
  }

  Future<Sprint> getSprints(int page, int size) {
    return SprintService.getSprints(page, size);
  }

  // For Pagination
  void paginateSprint() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("reached end");
        page++;
        getMoreSprint(page);
      }
    });
  }

// Save Data
  void saveSprint(Map data) {
    try {
      isProcessing(true);
      SprintService().saveSprint(data).then((resp) {
        // ignore: unrelated_type_equality_checks
        if (resp == "success") {
          clearTextEditingControllers();
          isProcessing(false);
          showSnackBar("Add Sprint", "Failed to Add Sprint", Colors.red);
          SprintTask.clear();
          refreshList();
        } else {
          showSnackBar("Add Sprint", "Sprint Added", Colors.green );
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
  void updateSprint(Map data, String id) {
    try {
      isProcessing(true);
      SprintService.updateSprint(data, id).then((resp) {
        if(resp=="success") {
          clearTextEditingControllers();
          isProcessing(false);

          showSnackBar("Edit Sprint", "Sprint not Updated", Colors.red );
          SprintTask.clear();
          refreshList();
        }
        else
          {
            showSnackBar("Edit Sprint", "Sprint Updated", Colors.green);
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
  void deleteSprint(String id) {
    try {
      isProcessing(true);
      SprintService().deleteSprint(id).then((resp) {
        isProcessing(false);
        if (resp == "success") {
          showSnackBar("Delete Sprint",  "Sprint not Deleted", Colors.red );
          SprintTask.clear();
          refreshList();
        } else {
          showSnackBar("Delete Sprint", "Sprint Deleted", Colors.green);
        }
      }, onError: (err) {
        isProcessing(false);
        showSnackBar("", "Sprint Deleted", Colors.green);
      });
    } catch (exception) {
      isProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }
  
  // Get More data
  void getMoreSprint(var page) {
    try {
      getSprints(page, size).then((resp) {
        if (resp != null) {
          SprintTask.addAll(resp.data);
          print("Service length : " + SprintTask.length.toString());
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
    getSprints(page, size);
  }
  // clear the controllers
  void clearTextEditingControllers() {
    sprintnameEditingController.clear();
    startdateEditingController.clear();
    duedateEditingController.clear();
  }
  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
    sprintnameEditingController.dispose();
    startdateEditingController.dispose();
    duedateEditingController.dispose();
    
  }
}
