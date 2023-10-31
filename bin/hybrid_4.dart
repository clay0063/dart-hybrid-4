import 'package:hybrid_4/hybrid_4.dart' as utils;
//importing dart:async gives a redundant warning
void main(List<String> arguments) async {

  String base = 'random-data-api.com';
  String path = '/api/v2/users';
  Map<String, String> params = {'size': '10'};

  List<dynamic> jsonList = await utils.fetchData(base, path, params);
  List<Map<String, String>> userList = utils.getNameAndID(jsonList);

  for (var user in userList) {
    String uid = user['uid'] ?? 'NO UID';
    String firstName = user['first_name'] ?? 'NO NAME';
    String lastName = user['last_name'] ?? 'NO SURNAME';
    print('ID #$uid\t$firstName $lastName');
  }

  
}