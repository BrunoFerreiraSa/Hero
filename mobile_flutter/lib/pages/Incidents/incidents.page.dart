import 'package:flutter/material.dart';

class Incidents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Image.asset(
              "images/logo.png",
              height: 50,
            ),
            Spacer(),
            Text(
              "Total de 0 casos",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: body(),
    );
  }

  body() {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 40, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bem-Vindo",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Escolha um dos casos abaixo e salve o dia",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
