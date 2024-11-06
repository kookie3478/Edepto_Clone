class ExamCategoryModel {
  ExamCategoryModel({
      String? status, 
      String? message, 
      num? responseCode, 
      List<ExamCategoryData>? data,}){
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
}

  ExamCategoryModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _responseCode = json['responseCode'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ExamCategoryData.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  num? _responseCode;
  List<ExamCategoryData>? _data;

  String? get status => _status;
  String? get message => _message;
  num? get responseCode => _responseCode;
  List<ExamCategoryData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['responseCode'] = _responseCode;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ExamCategoryData {
  ExamCategoryData({
      String? id, 
      String? categoryName, 
      String? icon, 
      bool? isDeleted,}){
    _id = id;
    _categoryName = categoryName;
    _icon = icon;
    _isDeleted = isDeleted;
}

  ExamCategoryData.fromJson(dynamic json) {
    _id = json['_id'];
    _categoryName = json['categoryName'];
    _icon = json['icon'];
    _isDeleted = json['isDeleted'];
  }
  String? _id;
  String? _categoryName;
  String? _icon;
  bool? _isDeleted;

  String? get id => _id;
  String? get categoryName => _categoryName;
  String? get icon => _icon;
  bool? get isDeleted => _isDeleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['categoryName'] = _categoryName;
    map['icon'] = _icon;
    map['isDeleted'] = _isDeleted;
    return map;
  }

}