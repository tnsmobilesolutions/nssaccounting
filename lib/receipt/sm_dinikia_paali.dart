import 'package:flutter/material.dart';

enum Payment { cash, bank }
enum PaymentType { online, cheque, dd }

class SMDinikiaPaali extends StatefulWidget {
  const SMDinikiaPaali({Key? key}) : super(key: key);

  @override
  State<SMDinikiaPaali> createState() => _SMDinikiaPaaliState();
}

class _SMDinikiaPaaliState extends State<SMDinikiaPaali> {
  Payment? _paymentMode = Payment.cash;
  PaymentType? _paymentType = PaymentType.online;

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Text('SM Dinikia Paali'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                style: TextStyle(height: 0.5),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Sangha',
                    hintText: 'Enter Sangha'),
              ),
              SizedBox(height: 12),
              TextField(
                style: TextStyle(height: 0.5),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Name',
                    hintText: 'Enter Name'),
              ),
              SizedBox(height: 12),
              TextField(
                style: TextStyle(height: 0.5),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Amount',
                    hintText: 'Amount'),
              ),
              SizedBox(height: 12),
              TextField(
                style: TextStyle(height: 0.5),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Paali Date',
                    hintText: 'Paali Date'),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    'Payment',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    child: ListTile(
                      title: const Text('Cash'),
                      leading: Radio<Payment>(
                        value: Payment.cash,
                        groupValue: _paymentMode,
                        onChanged: (Payment? value) {
                          setState(() {
                            _paymentMode = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                      title: const Text('Bank'),
                      leading: Radio<Payment>(
                        value: Payment.bank,
                        groupValue: _paymentMode,
                        onChanged: (Payment? value) {
                          setState(() {
                            _paymentMode = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              if (_paymentMode == Payment.bank)
                Column(
                  children: [
                    Row(
                      children: [
                        Text("Mode"),
                        Flexible(
                          child: ListTile(
                            title: Text('Online'),
                            leading: Radio<PaymentType>(
                                value: PaymentType.online,
                                groupValue: _paymentType,
                                onChanged: (PaymentType? value) {
                                  setState(() {
                                    _paymentType = value;
                                  });
                                }),
                          ),
                        ),
                        Flexible(
                          child: ListTile(
                            title: Text('Cheque'),
                            leading: Radio<PaymentType>(
                                value: PaymentType.cheque,
                                groupValue: _paymentType,
                                onChanged: (PaymentType? value) {
                                  setState(() {
                                    _paymentType = value;
                                  });
                                }),
                          ),
                        ),
                        Flexible(
                          child: ListTile(
                            title: Text('DD'),
                            leading: Radio<PaymentType>(
                                value: PaymentType.dd,
                                groupValue: _paymentType,
                                onChanged: (PaymentType? value) {
                                  setState(() {
                                    _paymentType = value;
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: const [
                        Flexible(
                          child: TextField(
                            style: TextStyle(height: 0.5),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Transaction Number',
                              hintText: 'Transaction Number',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              SizedBox(height: 12),
              TextField(
                style: TextStyle(height: 0.5),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Received By',
                    hintText: 'Received By'),
              ),
              SizedBox(height: 12),
              TextField(
                style: TextStyle(height: 0.5),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Remark',
                    hintText: 'Remark'),
              ),
              SizedBox(height: 18),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {},
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
