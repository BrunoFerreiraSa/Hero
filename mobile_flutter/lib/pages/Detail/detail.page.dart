import 'package:flutter/material.dart';
import 'package:mobile_flutter/pages/Incidents/incident.card.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatelessWidget {
  final String ong;
  final String caso;
  final double value;
  final String whatsapp;
  final String email;

  Detail({
    required this.ong,
    required this.caso,
    required this.value,
    required this.whatsapp,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          children: [
            Image.asset(
              "images/logo.png",
              height: 50,
            ),
            Spacer(),
            IconButton(
              iconSize: 30,
              color: Color(0xffE02041),
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: body(),
    );
  }

  body() {
    String message =
        "Olá $ong, estou entrando em contato pois gostaria de no caso $caso com o valor de R\$ $value ";
    return Container(
      height: double.maxFinite,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: ListView(
        children: [
          SizedBox(height: 40),
          IncidentCard(
            ong: ong,
            caso: caso,
            value: value,
          ),
          SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Salve o dia",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Seja o heroi desse caso.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Entre em contato",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xffE02041),
                        ),
                        child: TextButton(
                          child: Text(
                            "WhatsApp",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () => whatsApp(message: message),
                        ),
                      ),
                      Container(
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xffE02041),
                        ),
                        child: TextButton(
                          child: Text(
                            "E-mail",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () => emailSend(message: message),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  whatsApp({var message}) async {
    var whatsappUrl = "whatsapp://send?phone=$whatsapp&text=$message";

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  emailSend({var message}) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Ajudar&body=$message',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
