import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import 'custom_widget/AppTextFeild.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({
    Key? key,
  }) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  final _cardHolderController = TextEditingController();
  final _cardNoController = TextEditingController();
  final _expiryDateController =  MaskedTextController(mask: '00/0000');

  Widget _buildCardDetailsView() {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
            Text(
             (_cardHolderController.text.isEmpty)?"N/A": _cardHolderController.text.toUpperCase(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
             (_cardHolderController.text.isEmpty)?"N/A" :_cardNoController.text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "EXPIRY DATE",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
             _expiryDateController.text.isEmpty?"N/A": _expiryDateController.text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Credit Card"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Column(
            children: [
              _buildCardDetailsView(),
              SizedBox(
                height: 20,
              ),
              AppTextField(
                  hintText: "Card Holder Name",
                  onChanged: (String text){
                    setState(() {
                      
                    });
                  },
                  controller: _cardHolderController,
                  textCapitalization: TextCapitalization.characters,
                  textInputType: TextInputType.name),
              SizedBox(
                height: 20,
              ),
              AppTextField(
                  hintText: "Card Number",
                   onChanged: (String text){
                    setState(() {
                      
                    });
                  },
                  controller: _cardNoController,
                  textInputType: TextInputType.number),
              SizedBox(
                height: 20,
              ),
              AppTextField(
                  hintText: "Expiry Date (MM/YYYY)",
                  controller: _expiryDateController,
                   onChanged: (String text){
                    setState(() {
                      
                    });
                  },
                  textInputType: TextInputType.number),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
