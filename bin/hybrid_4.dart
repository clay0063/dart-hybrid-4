import 'package:hybrid_4/hybrid_4.dart' as utils;

void main(List<String> arguments) async {

  var base = 'random-data-api.com';
  var path = '/api/v2/users';
  var params = {'size': '10'};

  var json = await utils.fetchData(base, path, params);
  var userList = utils.getNameAndID(json);

  for (var item in userList) {
    var uid = item['uid'];
    var firstName = item['first_name'];
    var lastName = item['last_name'];
    print('$firstName $lastName, id #$uid\n');
  }
  
}


