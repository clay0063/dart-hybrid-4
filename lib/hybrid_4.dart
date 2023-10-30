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