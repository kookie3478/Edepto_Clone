class CurrentAffairsModel {
  CurrentAffairsModel({
    String? status,
    String? message,
    num? responseCode,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
  }

  CurrentAffairsModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _responseCode = json['responseCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  num? _responseCode;
  Data? _data;

  String? get status => _status;
  String? get message => _message;
  num? get responseCode => _responseCode;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['responseCode'] = _responseCode;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    List<CurrentAffaiirsData>? value,
    num? page,
    num? limit,
  }) {
    _value = value;
    _page = page;
    _limit = limit;
  }

  Data.fromJson(dynamic json) {
    if (json['value'] != null) {
      _value = [];
      json['value'].forEach((v) {
        _value?.add(CurrentAffaiirsData.fromJson(v));
      });
    }
    _page = json['page'];
    _limit = json['limit'];
  }
  List<CurrentAffaiirsData>? _value;
  num? _page;
  num? _limit;

  List<CurrentAffaiirsData>? get value => _value;
  num? get page => _page;
  num? get limit => _limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_value != null) {
      map['value'] = _value?.map((v) => v.toJson()).toList();
    }
    map['page'] = _page;
    map['limit'] = _limit;
    return map;
  }
}

class CurrentAffaiirsData {
  CurrentAffaiirsData({
    String? id,
    String? sourceId,
    String? imageUrl,
    String? categoryName,
    String? categoryId,
    String? publishDate,
    String? title,
    String? description,
  }) {
    _id = id;
    _sourceId = sourceId;
    _imageUrl = imageUrl;
    _categoryName = categoryName;
    _categoryId = categoryId;
    _publishDate = publishDate;
    _title = title;
    _description = description;
  }

  CurrentAffaiirsData.fromJson(dynamic json) {
    _id = json['_id'];
    _sourceId = json['sourceId'];
    _imageUrl = json['imageUrl'];
    _categoryName = json['categoryName'];
    _categoryId = json['categoryId'];
    _publishDate = json['publishDate'];
    _title = json['title'];
    _description = json['description'];
  }
  String? _id;
  String? _sourceId;
  String? _imageUrl;
  String? _categoryName;
  String? _categoryId;
  String? _publishDate;
  String? _title;
  String? _description;

  String? get id => _id;
  String? get sourceId => _sourceId;
  String? get imageUrl => _imageUrl;
  String? get categoryName => _categoryName;
  String? get categoryId => _categoryId;
  String? get publishDate => _publishDate;
  String? get title => _title;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['sourceId'] = _sourceId;
    map['imageUrl'] = _imageUrl;
    map['categoryName'] = _categoryName;
    map['categoryId'] = _categoryId;
    map['publishDate'] = _publishDate;
    map['title'] = _title;
    map['description'] = _description;
    return map;
  }
}
