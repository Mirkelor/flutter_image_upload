import 'package:flutter/foundation.dart';

class ImagePathProvider with ChangeNotifier{
  Map<String, String> _paths;
  bool _loadingPath;

  Map<String, String> get paths => _paths;
  bool get loadingPath => _loadingPath;

  void setLoadingPath(bool b){
    _loadingPath = b;
    notifyListeners();
  }

  void setPaths(Map<String, String> paths){
    _paths = paths;
    notifyListeners();
  }

  void clear(){
    _paths = {};
    _loadingPath = false;
    notifyListeners();
  }
}