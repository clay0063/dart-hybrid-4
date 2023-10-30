import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

List<Map<String, String>> getNameAndID(List<dynamic> dataList) {

  List<Map<String, String>> extractedData = [];
  
  for (var item in dataList) {
    var extractedItem = Map<String, String>.from({
      'uid': item['uid'].toString(), 
      'first_name': item['first_name'], 
      'last_name': item['last_name']
      });

    extractedData.add(extractedItem);
  }

  return extractedData;
}

Future<List<dynamic>> fetchData(String base, String path, Map<String, String> params) async {
  try {
    var uri = Uri.https(base, path, params);
    var response = await http.get(uri);
    var json = convert.jsonDecode(response.body) as List<dynamic>;
    return json;
  } catch (err) {
    print('Error fetching data: $err');
    return List<dynamic>.empty();
  }
}