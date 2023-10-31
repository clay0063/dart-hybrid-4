import 'package:hybrid_4/hybrid_4.dart' as utils;

void main(List<String> arguments) async {

  String base = 'random-data-api.com';
  String path = '/api/v2/users';
  Map<String, String> params = {'size': '10'};

  List<Map<String, String>> jsonList = await utils.fetchData(base, path, params);

  for (var item in jsonList) {
    String uid = item['uid'] ?? 'NO UID';
    String firstName = item['first_name'] ?? 'NO NAME';
    String lastName = item['last_name'] ?? 'NO SURNAME';
    print('ID #$uid\t$firstName $lastName\n');
  }
  
}