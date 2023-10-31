import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

List<Map<String, String>> getNameAndID(List<dynamic> dataList) {
  //asserting that the fetch is a List<dynamic> prevents it from fetching only 0 or 1 items
  List<Map<String, String>> extractedData = [];
  
  for (var item in dataList) {
    Map<String, String> extractedItem = Map<String, String>.from({
      'uid': item['uid'].toString(), 
      'first_name': item['first_name'], 
      'last_name': item['last_name']
      });

    extractedData.add(extractedItem);
  }

  return extractedData;
}

Future<List<Map<String, dynamic>>> fetchData(String base, String path, Map<String, String> params) async {
  try {
    var uri = Uri.https(base, path, params);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body) as List<dynamic>;
      return assertMapList(json);
    } else {
      String error = response.statusCode.toString();
      print('Error fetching data: status code $error');
      return List<Map<String, dynamic>>.empty();
    }
  } catch (err) {
    print('Error fetching data: $err');
    return List<Map<String, dynamic>>.empty();
    //if try-catch is done here, then any thrown error will stop here, making wrapping it in main as well unnecessary
  }

  //can also make "params" optional by wrapping it in a [?] in the func param list
  //and then Uri.https will automatically not include a null params
}


List<Map<String, dynamic>> assertMapList(List<dynamic> jsonList) {
  return List<Map<String, dynamic>>.from(jsonList.map((dynamic item) {
      return Map<String, dynamic>.from(item); 
    }));
    //returning as string, dynamic as there are objects within objects in this JSON
}
