import 'package:flutter/material.dart';
import 'package:kalkulator/theme.dart';
import 'calculator.dart';

class History extends StatelessWidget {
  History({@required this.operations});

  final List<String> operations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 1,
        title: Text('History',
            style:
                fontBlack.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: false,
        leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Center(
        child: _operationsList(operations),
      ),
    );
  }

  Widget _operationsList(List<String> operations) {
    return ListView.builder(
      itemCount: operations.length,
      itemBuilder: (BuildContext context, int i) {
        return ListTile(
          title: Text(operations[i], style: fontBlack),
          onTap: () {
            Navigator.pop(context, operations[i]);
          },
          leading: Container(
            width: 150,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red[800], width: 2.0),
                borderRadius: BorderRadius.circular(50)),
            child: Text(
              Calculator.parseString(operations[i]),
              style:
                  fontBlack.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.all(5),
          ),
        );
      },
    );
  }
}
