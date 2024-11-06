class DashboardModel {
  DashboardModel({
    String? status,
    String? message,
    num? responseCode,
    DashBoardData? data,
  }) {
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
  }

  DashboardModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _responseCode = json['responseCode'];
    _data = json['data'] != null ? DashBoardData.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  num? _responseCode;
  DashBoardData? _data;

  String? get status => _status;
  String? get message => _message;
  num? get responseCode => _responseCode;
  DashBoardData? get data => _data;

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

class DashBoardData {
  DashBoardData({
    String? id,
    String? subCategoryName,
    List<String>? categoryIds,
    String? colourHex,
    String? icon,
    List<Languages>? languages,
    num? paidTestCount,
    num? freeTestCount,
    List<TestSections>? testSections,
    String? description,
    List<Faqs>? faqs,
    bool? isDeleted,
    String? updatedBy,
  }) {
    _id = id;
    _subCategoryName = subCategoryName;
    _categoryIds = categoryIds;
    _colourHex = colourHex;
    _icon = icon;
    _languages = languages;
    _paidTestCount = paidTestCount;
    _freeTestCount = freeTestCount;
    _testSections = testSections;
    _description = description;
    _faqs = faqs;
    _isDeleted = isDeleted;
    _updatedBy = updatedBy;
  }

  DashBoardData.fromJson(dynamic json) {
    _id = json['_id'];
    _subCategoryName = json['subCategoryName'];
    _categoryIds =
        json['categoryIds'] != null ? json['categoryIds'].cast<String>() : [];
    _colourHex = json['colourHex'];
    _icon = json['icon'];
    if (json['languages'] != null) {
      _languages = [];
      json['languages'].forEach((v) {
        _languages?.add(Languages.fromJson(v));
      });
    }
    _paidTestCount = json['paidTestCount'];
    _freeTestCount = json['freeTestCount'];
    if (json['testSections'] != null) {
      _testSections = [];
      json['testSections'].forEach((v) {
        _testSections?.add(TestSections.fromJson(v));
      });
    }
    _description = json['description'];
    if (json['faqs'] != null) {
      _faqs = [];
      json['faqs'].forEach((v) {
        _faqs?.add(Faqs.fromJson(v));
      });
    }
    _isDeleted = json['isDeleted'];
    _updatedBy = json['updatedBy'];
  }
  String? _id;
  String? _subCategoryName;
  List<String>? _categoryIds;
  String? _colourHex;
  String? _icon;
  List<Languages>? _languages;
  num? _paidTestCount;
  num? _freeTestCount;
  List<TestSections>? _testSections;
  String? _description;
  List<Faqs>? _faqs;
  bool? _isDeleted;
  String? _updatedBy;

  String? get id => _id;
  String? get subCategoryName => _subCategoryName;
  List<String>? get categoryIds => _categoryIds;
  String? get colourHex => _colourHex;
  String? get icon => _icon;
  List<Languages>? get languages => _languages;
  num? get paidTestCount => _paidTestCount;
  num? get freeTestCount => _freeTestCount;
  List<TestSections>? get testSections => _testSections;
  String? get description => _description;
  List<Faqs>? get faqs => _faqs;
  bool? get isDeleted => _isDeleted;
  String? get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['subCategoryName'] = _subCategoryName;
    map['categoryIds'] = _categoryIds;
    map['colourHex'] = _colourHex;
    map['icon'] = _icon;
    if (_languages != null) {
      map['languages'] = _languages?.map((v) => v.toJson()).toList();
    }
    map['paidTestCount'] = _paidTestCount;
    map['freeTestCount'] = _freeTestCount;
    if (_testSections != null) {
      map['testSections'] = _testSections?.map((v) => v.toJson()).toList();
    }
    map['description'] = _description;
    if (_faqs != null) {
      map['faqs'] = _faqs?.map((v) => v.toJson()).toList();
    }
    map['isDeleted'] = _isDeleted;
    map['updatedBy'] = _updatedBy;
    return map;
  }
}

class Faqs {
  Faqs({
    String? question,
    String? answer,
    String? id,
  }) {
    _question = question;
    _answer = answer;
    _id = id;
  }

  Faqs.fromJson(dynamic json) {
    _question = json['question'];
    _answer = json['answer'];
    _id = json['_id'];
  }
  String? _question;
  String? _answer;
  String? _id;

  String? get question => _question;
  String? get answer => _answer;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['question'] = _question;
    map['answer'] = _answer;
    map['_id'] = _id;
    return map;
  }
}

class TestSections {
  TestSections({
    String? name,
    String? shortName,
    num? paidTestCount,
    num? freeTestCount,
    num? orderBy,
    List<Subsections>? subsections,
    String? id,
    num? attemptedTest,
    num? accuracy,
  }) {
    _name = name;
    _shortName = shortName;
    _paidTestCount = paidTestCount;
    _freeTestCount = freeTestCount;
    _orderBy = orderBy;
    _subsections = subsections;
    _id = id;
    _attemptedTest = attemptedTest;
    _accuracy = accuracy;
  }

  TestSections.fromJson(dynamic json) {
    _name = json['name'];
    _shortName = json['shortName'];
    _paidTestCount = json['paidTestCount'];
    _freeTestCount = json['freeTestCount'];
    _orderBy = json['orderBy'];
    if (json['subsections'] != null) {
      _subsections = [];
      json['subsections'].forEach((v) {
        _subsections?.add(Subsections.fromJson(v));
      });
    }
    _id = json['_id'];
    _attemptedTest = json['attemptedTest'];
    _accuracy = json['accuracy'];
  }
  String? _name;
  String? _shortName;
  num? _paidTestCount;
  num? _freeTestCount;
  num? _orderBy;
  List<Subsections>? _subsections;
  String? _id;
  num? _attemptedTest;
  num? _accuracy;

  String? get name => _name;
  String? get shortName => _shortName;
  num? get paidTestCount => _paidTestCount;
  num? get freeTestCount => _freeTestCount;
  num? get orderBy => _orderBy;
  List<Subsections>? get subsections => _subsections;
  String? get id => _id;
  num? get attemptedTest => _attemptedTest;
  num? get accuracy => _accuracy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['shortName'] = _shortName;
    map['paidTestCount'] = _paidTestCount;
    map['freeTestCount'] = _freeTestCount;
    map['orderBy'] = _orderBy;
    if (_subsections != null) {
      map['subsections'] = _subsections?.map((v) => v.toJson()).toList();
    }
    map['_id'] = _id;
    map['attemptedTest'] = _attemptedTest;
    map['accuracy'] = _accuracy;
    return map;
  }
}

class Subsections {
  Subsections({
    String? name,
    String? shortName,
    num? paidTestCount,
    num? freeTestCount,
    num? orderBy,
    String? id,
  }) {
    _name = name;
    _shortName = shortName;
    _paidTestCount = paidTestCount;
    _freeTestCount = freeTestCount;
    _orderBy = orderBy;
    _id = id;
  }

  Subsections.fromJson(dynamic json) {
    _name = json['name'];
    _shortName = json['shortName'];
    _paidTestCount = json['paidTestCount'];
    _freeTestCount = json['freeTestCount'];
    _orderBy = json['orderBy'];
    _id = json['_id'];
  }
  String? _name;
  String? _shortName;
  num? _paidTestCount;
  num? _freeTestCount;
  num? _orderBy;
  String? _id;

  String? get name => _name;
  String? get shortName => _shortName;
  num? get paidTestCount => _paidTestCount;
  num? get freeTestCount => _freeTestCount;
  num? get orderBy => _orderBy;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['shortName'] = _shortName;
    map['paidTestCount'] = _paidTestCount;
    map['freeTestCount'] = _freeTestCount;
    map['orderBy'] = _orderBy;
    map['_id'] = _id;
    return map;
  }
}

class Languages {
  Languages({
    String? id,
    String? language,
  }) {
    _id = id;
    _language = language;
  }

  Languages.fromJson(dynamic json) {
    _id = json['_id'];
    _language = json['language'];
  }
  String? _id;
  String? _language;

  String? get id => _id;
  String? get language => _language;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['language'] = _language;
    return map;
  }
}
