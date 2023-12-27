// Target: Interface expected by the new system
import 'dart:convert';

import 'package:flutter_design_patterns/adapter/web_service.dart';

abstract class DataProvider {
  Map<String, dynamic> fetchData();
}

// Adapter: Adapts WebService to DataProvider
class WebServiceAdapter implements DataProvider {
  WebService _webService;

  WebServiceAdapter(this._webService);

  @override
  Map<String, dynamic> fetchData() {
    String jsonResult = _webService.fetchData();
    // Convert JSON string to Dart object
    Map<String, dynamic> data = json.decode(jsonResult);
    return data;
  }
}
