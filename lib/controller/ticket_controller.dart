import 'package:ctse_frontend/colors/colors.dart';
import 'package:ctse_frontend/model/ticket_model.dart';
import 'package:ctse_frontend/service/ticket_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class TicketController extends GetxController {
  var TicketTask = List<Datum3>.empty(growable: true).obs;
  var page = 0;
  var size = 9;
  var isDataProcessing = false.obs;

  // For Pagination
  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = true.obs;

  // To Save Task
  TextEditingController ticketnameEditingController;
  TextEditingController ticketdateEditingController;
  TextEditingController ticketdesEditingController;
  TextEditingController ticketstatusEditingController;
  TextEditingController ticketcommentEditingController;

  var isProcessing = false.obs;

  @override
  void onInit() {
    super.onInit();
    getMoreTicket(page);
    paginateTicket();
    // To Save  Task
    ticketnameEditingController = TextEditingController();
    ticketdateEditingController = TextEditingController();
    ticketdesEditingController = TextEditingController();
    ticketstatusEditingController = TextEditingController();
    ticketcommentEditingController = TextEditingController();
  }

  Future<Ticket> getTickets(int page, int size) {
    return TicketService.getTickets(page, size);
  }

  // For Pagination
  void paginateTicket() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("reached end");
        page++;
        getMoreTicket(page);
      }
    });
  }

// Save Data
  void saveTicket(Map data) {
    try {
      isProcessing(true);
      TicketService().saveTicket(data).then((resp) {
        // ignore: unrelated_type_equality_checks
        if (resp == "success") {
          clearTextEditingControllers();
          isProcessing(false);
          showSnackBar("Add Ticket", "Failed to Add Ticket", Colors.red);
          TicketTask.clear();
          refreshList();
        } else {
          showSnackBar("Add Ticket", "Ticket Added", Colors.green);
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
  void updateTicket(Map data, String id) {
    try {
      isProcessing(true);
      TicketService.updateTicket(data, id).then((resp) {
        if (resp == "success") {
          clearTextEditingControllers();
          isProcessing(false);

          showSnackBar("Edit Ticket", "Ticket not Updated", Colors.red);
          TicketTask.clear();
          refreshList();
        } else {
          showSnackBar("Edit Ticket", "Ticket Updated", Colors.green);
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
  void deleteTicket(String id) {
    try {
      isProcessing(true);
      TicketService().deleteTicket(id).then((resp) {
        isProcessing(false);
        if (resp == "success") {
          showSnackBar("Delete Ticket", "Ticket Deleted", Colors.green);
          TicketTask.clear();
          refreshList();
        } else {
          showSnackBar("Delete Ticket", "Ticket not Deleted", Colors.red);
        }
      }, onError: (err) {
        isProcessing(false);
        showSnackBar("", "Ticket Deleted", Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  // Get More data
  void getMoreTicket(var page) {
    try {
      getTickets(page, size).then((resp) {
        if (resp != null) {
          TicketTask.addAll(resp.data);
          print("Service length : " + TicketTask.length.toString());
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
    getTickets(page, size);
  }

  // clear the controllers
  void clearTextEditingControllers() {
    ticketnameEditingController.clear();
    ticketdateEditingController.clear();
    ticketdesEditingController.clear();
    ticketstatusEditingController.clear();
    ticketcommentEditingController.clear();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
    ticketnameEditingController.dispose();
    ticketdateEditingController.dispose();
    ticketdesEditingController.dispose();
    ticketstatusEditingController.dispose();
    ticketcommentEditingController.dispose();
  }
}
