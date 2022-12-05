import 'package:flutter/material.dart';
import 'package:water_billing/meter_card.dart';
import 'package:water_billing/models/menu_item.dart';

class PayBill extends StatefulWidget {
  const PayBill({super.key});

  @override
  State<PayBill> createState() => _PayBillState();
}

class _PayBillState extends State<PayBill> {
  String? _selectedItem;
  final amountCtr = TextEditingController();
  final phoneCtr = TextEditingController();
  final networkCtr = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final menuItems = [
    NetworkMenuItem(imageUrl: 'assets/mtn.jpeg', name: 'MTN'),
    NetworkMenuItem(imageUrl: 'assets/vodafone.png', name: 'Vodafone'),
    NetworkMenuItem(imageUrl: 'assets/airteltigo.jpeg', name: 'Airtel Tigo'),
    NetworkMenuItem(imageUrl: 'assets/debit.png', name: 'Debit Card'),
  ];

  @override
  void dispose() {
    amountCtr.dispose();
    phoneCtr.dispose();
    networkCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pay Bill'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const SizedBox(
                    width: double.infinity,
                    child: MeterCard(),
                  ),
                  const SizedBox(height: 20),
                  _buildHeaderText(),
                  const SizedBox(height: 10),
                  _buildAmountInput(),
                  const SizedBox(height: 20),
                  _buildPhoneNumberInput(),
                  const SizedBox(height: 20),
                  _buildDropDown(),
                  const SizedBox(height: 20),
                  _buildSubmit(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _handleSubmit() {
    if (formKey.currentState!.validate()) {
      final amount = amountCtr.text.trim();
      final phoneNumber = phoneCtr.text.trim();
      // final network = networkCtr.text.trim();

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Payment Confirmation'),
              content: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(
                      text: 'An authorization message of GHC ',
                    ),
                    TextSpan(
                      text: amount,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: ' has been sent to ',
                    ),
                    TextSpan(
                      text: phoneNumber,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: '. Please input your PIN to complete the payment',
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                      ..pop()
                      ..pop();
                  },
                  child: const Text('Ok'),
                )
              ],
            );
          });
    }
  }

  _buildDropDown() {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          label: Text('Network Provider'),
        ),
        value: _selectedItem,
        items: menuItems
            .map(
              (item) => DropdownMenuItem(
                value: item.name,
                child: Row(
                  children: [
                    Image.asset(item.imageUrl, width: 20, height: 20),
                    const SizedBox(width: 15),
                    Text(item.name),
                  ],
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedItem = value;
            networkCtr.text = value!;
          });
        },
        validator: (value) {
          return value == null || value.isEmpty
              ? 'This field is required'
              : null;
        },
      ),
    );
  }

  _buildSubmit() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _handleSubmit,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Submit',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  _buildHeaderText() {
    return const Text(
      'Make Payment',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  _buildAmountInput() {
    return TextFormField(
      controller: amountCtr,
      decoration: const InputDecoration(
        label: Text('Amount'),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        return value == null || value.isEmpty ? 'This field is required' : null;
      },
    );
  }

  _buildPhoneNumberInput() {
    return TextFormField(
      controller: phoneCtr,
      decoration: const InputDecoration(
        label: Text('Phone Number'),
      ),
      validator: (value) {
        return value == null || value.isEmpty ? 'This field is required' : null;
      },
    );
  }
}
