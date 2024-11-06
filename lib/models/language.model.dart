class LanguageModel {
  LanguageModel({
    String? status,
    String? message,
    num? responseCode,
    List<LanguageData>? data,
  }) {
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
  }

  LanguageModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _responseCode = json['responseCode'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(LanguageData.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  num? _responseCode;
  List<LanguageData>? _data;

  String? get status => _status;
  String? get message => _message;
  num? get responseCode => _responseCode;
  List<LanguageData>? get data => _data;

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

class LanguageData {
  LanguageData({
    String? id,
    String? language,
    String? examLangCode,
    String? appLangCode,
  }) {
    _id = id;
    _language = language;
    _examLangCode = examLangCode;
    _appLangCode = appLangCode;
  }

  LanguageData.fromJson(dynamic json) {
    _id = json['_id'];
    _language = json['language'];
    _examLangCode = json['examLangCode'];
    _appLangCode = json['appLangCode'];
  }
  String? _id;
  String? _language;
  String? _examLangCode;
  String? _appLangCode;

  String? get id => _id;
  String? get language => _language;
  String? get examLangCode => _examLangCode;
  String? get appLangCode => _appLangCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['language'] = _language;
    map['examLangCode'] = _examLangCode;
    map['appLangCode'] = _appLangCode;
    return map;
  }
}
