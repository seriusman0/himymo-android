import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddTransactionController extends GetxController {
  final name = ''.obs;
  final type = 0.obs;
  final value = 0.obs;
  final date = DateTime.now().obs;

  void setName(String value) => name.value = value;
  void setType(int value) => type.value = value;
  void setValue(int value) => value = value;
  void setDate(DateTime value) => date.value = value;

  bool validate() {
    return name.value.isNotEmpty && value.value > 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name.value,
      'type': type.value,
      'value': value.value,
      'date': date.value.toIso8601String(),
    };
  }

  // void sendTransaction() async {
  //   final controller = Get.put(AddTransactionController());

  //   final url = Uri.parse('http://localhost:8080/v1/transactions');
  //   final headers = {
  //     'Content-Type': 'application/json',
  //     'x-api-key': 'secret-key',
  //   };

  //   final body = jsonEncode(controller.toJson());
  //   final response = await http.post(url, headers: headers, body: body);

  //   if (response.statusCode == 200) {
  //     // berhasil mengirim request
  //   } else {
  //     // gagal mengirim request
  //   }
  // }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
