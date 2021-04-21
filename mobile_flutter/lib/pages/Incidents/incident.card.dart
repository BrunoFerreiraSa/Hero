import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IncidentCard extends StatelessWidget {
  String ong = "";
  String caso = "";
  double value = 0;
  bool isVisible;
  VoidCallback? onPress;
  double heightCard;

  IncidentCard({
    Key? key,
    required this.ong,
    required this.caso,
    required this.value,
    this.isVisible = false,
    this.onPress,
    this.heightCard = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        height: heightCard,
        width: double.infinity,
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            BorderSide(color: Colors.white),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ONG: ",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    ong,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Caso:",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    caso,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "VALOR:",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "R\$ $value",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
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
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
