import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IncidentCard extends StatelessWidget {
  String ong = "";
  String caso = "";
  double value = 0;
  bool isVisible;
  VoidCallback? onPress;

  IncidentCard({
    Key? key,
    required this.ong,
    required this.caso,
    required this.value,
    this.isVisible = false,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        height: 200,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ONG:",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              ong,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Spacer(),
            Text(
              "Caso:",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              caso,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Spacer(),
            Text(
              "VALOR:",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              "R\$ $value",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Spacer(),
            isVisible
                ? Row(
                    children: [
                      TextButton(
                        onPressed: onPress,
                        child: Text(
                          "Ver mais detalhes",
                          style: TextStyle(
                            color: Color(0xffE02041),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xffE02041),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
