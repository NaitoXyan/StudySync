import 'dart:convert';
import 'package:http/http.dart' as http;

// list for activities
List<Map<String, String>> activitiesList = [];
List<dynamic> scheduleList = [];
// list for days
List<String> days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

getSchedule() async {
  var url = Uri.parse('http://127.0.0.1:8000/api/list');
  var response = await http.get(url);

  print(jsonDecode(response.body));
  scheduleList = jsonDecode(response.body);
  print(jsonDecode(response.body));
  print(scheduleList);
}

