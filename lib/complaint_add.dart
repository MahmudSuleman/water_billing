import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ComplaintAdd extends StatefulWidget {
  const ComplaintAdd({super.key});

  @override
  State<ComplaintAdd> createState() => _ComplaintAddState();
}

class _ComplaintAddState extends State<ComplaintAdd> {
  String? _selectedComplaint;
  XFile? _selectedPhoto;
  final formKey = GlobalKey<FormState>();
  final messageCtr = TextEditingController();

  final _complaints = [
    'Billing',
    'Leakage',
    'Payment',
    'Faulty Meter',
    'Illigal Connection',
    'Other',
  ];

  @override
  void dispose() {
    messageCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Complaint'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text('Complaint Type *'),
                  const SizedBox(height: 10),
                  DropdownButtonFormField(
                    hint: const Text('select...'),
                    value: _selectedComplaint,
                    items: _complaints
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedComplaint = value;
                      });
                    },
                    validator: (value) {
                      return value == null || value.isEmpty
                          ? 'This field is required'
                          : null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text('Message *'),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: messageCtr,
                    decoration: const InputDecoration(
                      hintText: 'Message',
                    ),
                    maxLines: 5,
                    maxLength: 200,
                    validator: (value) {
                      return value == null || value.isEmpty
                          ? 'This field is required'
                          : null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text('Select Photo'),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      width: 150,
                      height: 150,
                      child: _selectedPhoto == null
                          ? Center(
                              child: Icon(
                                Icons.photo,
                                color: Colors.grey.shade400,
                              ),
                            )
                          : _buildSelectedImageContainer(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handleSubmit,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleSubmit() {
    if (formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Complaint'),
              content: const Text(
                'Complaint submitted successfully.'
                ' We will attend to you shortly.',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                      ..pop()
                      ..pop()
                      ..pop();
                  },
                  child: const Text('Okay'),
                )
              ],
            );
          });
    }
  }

  ClipRRect _buildSelectedImageContainer() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Image.file(
            File(_selectedPhoto!.path),
            fit: BoxFit.cover,
            height: 150,
            width: 150,
          ),
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedPhoto = null;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(5),
                child: const Icon(Icons.close),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _pickImage() async {
    final ImagePicker picker = ImagePicker();
    _selectedPhoto = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }
}
