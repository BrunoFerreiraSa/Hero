import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobile_flutter/pages/Detail/detail.page.dart';
import 'package:mobile_flutter/pages/Incidents/incident.card.dart';

class Incidents extends StatefulWidget {
  @override
  _IncidentsState createState() => _IncidentsState();
}

class _IncidentsState extends State<Incidents> {
  List data = [];
  Future<String> getData() async {
    final String url = 'http://192.168.1.103:3333/incidents';

    var resp = await http.get(Uri.parse(url));
    setState(() {
      data = json.decode(resp.body);
    });

    return "";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

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
              "Total de ${data.length} casos",
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
      body: body(context),
    );
  }

  body(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16, top: 40, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
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
            ],
          ),
          SizedBox(height: 30),
          Container(
            height: 450,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: data.length,
              addAutomaticKeepAlives: true,
              itemBuilder: (context, i) {
                return IncidentCard(
                  ong: data[i]['name'],
                  caso: data[i]['description'],
                  value: double.parse(data[i]['value'].toString()),
                  isVisible: true,
                  onPress: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detail(
                        ong: data[i]['name'],
                        caso: data[i]['description'],
                        value: double.parse(data[i]['value'].toString()),
                        email: data[i]['email'],
                        whatsapp: data[i]['whatsapp'],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
