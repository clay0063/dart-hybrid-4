import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:hybrid_4/hybrid_4.dart' as utils;


void main(List<String> arguments) async {

  var base = 'random-data-api.com';
  var path = '/api/v2/users';
  var params = {'size': '10'};
  
  try {
    var uri = Uri.https(base, path, params);
    var response = await http.get(uri);
    
    var json = convert.jsonDecode(response.body) as List<dynamic>;
    var userList = utils.getNameAndID(json); //convert to string string, and extract only data needed

    for (var item in userList) {
      var uid = item['uid'];
      var firstName = item['first_name'];
      var lastName = item['last_name'];
      print('$firstName $lastName, id #$uid\n');
    }

  } catch (err){
    print('Failed http request: $err');
  }
  
}
