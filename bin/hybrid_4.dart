import 'package:hybrid_4/hybrid_4.dart' as hybrid_4;
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


void main(List<String> arguments) async {
  var base = 'random-data-api.com';
  var path = '/api/v2/users';
  var params = {'size': '5'};
  try {
    var uri = Uri.https(base, path, params);
    var response = await http.get(uri);
    //"read" is used to read the response as a string. "get" is used to store the entire response
    var json = convert.jsonDecode(response.body) as List<dynamic>;

    List<Map<String, dynamic>> extractedData = [];

    for (var item in json) {
      var extractedItem = {'id': item['id'], 'username': item['username']};

      extractedData.add(extractedItem);
    }
    
    for (var item in extractedData) {
      print(item);
      print('');
    }
  } catch (err){
    print('Failed http request: $err');
  }
  
}
