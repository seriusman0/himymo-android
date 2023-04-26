import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:himymo_android/app/modules/add_transaction/bindings/add_transaction_binding.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              color: Colors.blue, // warna background button
              borderRadius: BorderRadius.circular(8.0), // radius sudut button
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 8.0), // padding dalam button
              child: Text('Button Text'),
              onPressed: () {
                Get.toNamed('/add-transaction');
              },
            )
          ],
        ),
      ),
    );
  }
}
