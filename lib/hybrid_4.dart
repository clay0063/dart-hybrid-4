import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<List<Map<String, String>>> fetchData(String base, String path, Map<String, String> params) async {
  try {
    var uri = Uri.https(base, path, params);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body) as List<dynamic>;
      return convertToJSON(json);
    } else {
      String error = response.statusCode.toString();
      print('Error fetching data: status code $error');
      return List<Map<String, String>>.empty();
    }
  } catch (err) {
    print('Error fetching data: $err');
    return List<Map<String, String>>.empty();
    //if try-catch is done here, then any thrown error will stop here, making wrapping it in main as well unnecessary
  }

  //can also make "params" optional by wrapping it in a [?] in the func param list
  //and then Uri.https will automatically not include a null params
}

List<Map<String, String>> convertToJSON(List<dynamic> jsonList) {
  //asserting that the fetch is a List<dynamic> prevents it from fetching only 0 or 1 items
  return List<Map<String, String>>.from(jsonList.map((dynamic item) {
    Map<String, String> newMap = {};
    item.forEach((key, value) {
      newMap[key] = value.toString();
    });
    return newMap;
  }));
}
