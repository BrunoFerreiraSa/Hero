import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

abstract class Api {
  static Future<List> getData() async {
    var url = "http://localhost:3333/incidents";

    var resp = await http.get(Uri.parse(url));

    List data = convert.jsonDecode(resp.body);

    return data;
  }
}
