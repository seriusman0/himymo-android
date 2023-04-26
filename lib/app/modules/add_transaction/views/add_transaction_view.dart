import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_transaction_controller.dart';
import 'package:intl/intl.dart';

class AddTransactionView extends StatelessWidget {
  final AddTransactionController controller =
      Get.put(AddTransactionController());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Transaction'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<int>(
                value: controller.type.value,
                onChanged: (int? value) {
                  if (value != null) {
                    controller.setType(value);
                  }
                },
                items: [
                  DropdownMenuItem(
                    value: 0,
                    child: Text('Expense'),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Text('Income'),
                  ),
                ],
                decoration: InputDecoration(labelText: 'Type'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a type';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: valueController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Value'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Value must be a number';
                  }
                  if (int.parse(value) <= 0) {
                    return 'Value must be greater than zero';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: dateController,
                readOnly: true,
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (selectedDate != null) {
                    controller.setDate(selectedDate);
                    dateController.text =
                        DateFormat.yMMMMd().format(selectedDate);
                  }
                },
                decoration: InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    controller.setName(nameController.text);
                    controller.setValue(int.parse(valueController.text));
                    Get.back(result: true);
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
