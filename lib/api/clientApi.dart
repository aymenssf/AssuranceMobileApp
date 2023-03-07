import 'dart:convert';
import 'package:http/http.dart' as http;
import 'client.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ClientApi {
  static Future<List<Client>> getAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var ndoss=prefs.getString('ndoss');
    final url = Uri.parse('http://192.168.186.118/loginflutter/info.php?id=${ndoss}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List client = json.decode(response.body);

      return client.map((json) => Client.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

}
