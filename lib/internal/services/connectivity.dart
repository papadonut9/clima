import 'dart:convert';

import 'package:clima/dependencies.dart';

class ConnectionHelper{
  final String url;
  ConnectionHelper(this.url);

  Future getData() async{
        // package:http/http.dart utilised. Since it was directly exported from dependencies.dart, I did not imported it using the 'as' keyword.
    Response response = await get(url);

    if(response.statusCode == 200){
      String data = response.body;

      return jsonDecode(data);
      
    } else{
      print(response.statusCode);
    }
  }
}