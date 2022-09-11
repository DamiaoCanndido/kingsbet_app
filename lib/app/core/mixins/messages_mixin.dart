import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessagesMixin on GetxController {
  void messageListener(Rxn<MessageModel> message) {
    ever<MessageModel?>(message, (model) async {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          backgroundColor: model.type.snackColor(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: model.type.textColor(),
          margin: const EdgeInsets.all(20),
          duration: const Duration(seconds: 1),
          mainButton: TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Fechar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    });
  }
}

class MessageModel {
  final String title;
  final String message;
  final MessageType type;

  MessageModel({
    required this.title,
    required this.message,
    required this.type,
  });
}

enum MessageType {
  error(Color.fromARGB(0, 0, 0, 0)),
  info(Color.fromARGB(0, 0, 0, 0));

  final Color color;
  const MessageType(this.color);

  Color snackColor() {
    switch (this) {
      case MessageType.error:
        return Colors.red[800]!;
      case MessageType.info:
        return Colors.blue[200]!;
    }
  }

  Color textColor() {
    switch (this) {
      case MessageType.error:
        return Colors.white;
      case MessageType.info:
        return Colors.black;
    }
  }
}
