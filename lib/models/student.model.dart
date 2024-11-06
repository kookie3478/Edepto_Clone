class StudentModel {
  StudentModel({
    String? status,
    String? message,
    num? responseCode,
    StudentData? data,
  }) {
    _status = status;
    _message = message;
    _responseCode = responseCode;
    _data = data;
  }

  StudentModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _responseCode = json['responseCode'];
    _data = json['data'] != null ? StudentData.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  num? _responseCode;
  StudentData? _data;

  String? get status => _status;
  String? get message => _message;
  num? get responseCode => _responseCode;
  StudentData? get data => _data;

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

class StudentData {
  StudentData({
    String? id,
    String? profilePic,
    String? mobileNumber,
    String? lastLogin,
    num? referralCount,
    num? category,
    String? categoryString,
    num? dailyTarget,
    num? initPage,
    num? depositCoin,
    num? earnedCoin,
    bool? isPromoter,
    bool? isPromoterApplied,
    bool? isEducator,
    bool? isEducatorApplied,
    bool? isEmailVerified,
    bool? isMobileVerified,
    bool? isProfileCompleted,
    String? createdAt,
    String? updatedAt,
    String? emailId,
    String? language,
    String? name,
    String? referralCode,
    String? selectedCourseId,
    String? autoLoginToken,
    bool? isInstituteEnrolled,
  }) {
    _id = id;
    _profilePic = profilePic;
    _mobileNumber = mobileNumber;
    _lastLogin = lastLogin;
    _referralCount = referralCount;
    _category = category;
    _categoryString = categoryString;
    _dailyTarget = dailyTarget;
    _initPage = initPage;
    _depositCoin = depositCoin;
    _earnedCoin = earnedCoin;
    _isPromoter = isPromoter;
    _isPromoterApplied = isPromoterApplied;
    _isEducator = isEducator;
    _isEducatorApplied = isEducatorApplied;
    _isEmailVerified = isEmailVerified;
    _isMobileVerified = isMobileVerified;
    _isProfileCompleted = isProfileCompleted;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _emailId = emailId;
    _language = language;
    _name = name;
    _referralCode = referralCode;
    _selectedCourseId = selectedCourseId;
    _autoLoginToken = autoLoginToken;
    _isInstituteEnrolled = isInstituteEnrolled;
  }

  StudentData.fromJson(dynamic json) {
    _id = json['_id'];
    _profilePic = json['profilePic'];
    _mobileNumber = json['mobileNumber'];
    _lastLogin = json['lastLogin'];
    _referralCount = json['referralCount'];
    _category = json['category'];
    _categoryString = json['categoryString'];
    _dailyTarget = json['dailyTarget'];
    _initPage = json['initPage'];
    _depositCoin = json['depositCoin'];
    _earnedCoin = json['earnedCoin'];
    _isPromoter = json['isPromoter'];
    _isPromoterApplied = json['isPromoterApplied'];
    _isEducator = json['isEducator'];
    _isEducatorApplied = json['isEducatorApplied'];
    _isEmailVerified = json['isEmailVerified'];
    _isMobileVerified = json['isMobileVerified'];
    _isProfileCompleted = json['isProfileCompleted'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _emailId = json['emailId'];
    _language = json['language'];
    _name = json['name'];
    _referralCode = json['referralCode'];
    _selectedCourseId = json['selectedCourseId'];
    _autoLoginToken = json['autoLoginToken'];
    _isInstituteEnrolled = json['isInstituteEnrolled'];
  }
  String? _id;
  String? _profilePic;
  String? _mobileNumber;
  String? _lastLogin;
  num? _referralCount;
  num? _category;
  String? _categoryString;
  num? _dailyTarget;
  num? _initPage;
  num? _depositCoin;
  num? _earnedCoin;
  bool? _isPromoter;
  bool? _isPromoterApplied;
  bool? _isEducator;
  bool? _isEducatorApplied;
  bool? _isEmailVerified;
  bool? _isMobileVerified;
  bool? _isProfileCompleted;
  String? _createdAt;
  String? _updatedAt;
  String? _emailId;
  String? _language;
  String? _name;
  String? _referralCode;
  String? _selectedCourseId;
  String? _autoLoginToken;
  bool? _isInstituteEnrolled;

  String? get id => _id;
  String? get profilePic => _profilePic;
  String? get mobileNumber => _mobileNumber;
  String? get lastLogin => _lastLogin;
  num? get referralCount => _referralCount;
  num? get category => _category;
  String? get categoryString => _categoryString;
  num? get dailyTarget => _dailyTarget;
  num? get initPage => _initPage;
  num? get depositCoin => _depositCoin;
  num? get earnedCoin => _earnedCoin;
  bool? get isPromoter => _isPromoter;
  bool? get isPromoterApplied => _isPromoterApplied;
  bool? get isEducator => _isEducator;
  bool? get isEducatorApplied => _isEducatorApplied;
  bool? get isEmailVerified => _isEmailVerified;
  bool? get isMobileVerified => _isMobileVerified;
  bool? get isProfileCompleted => _isProfileCompleted;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get emailId => _emailId;
  String? get language => _language;
  String? get name => _name;
  String? get referralCode => _referralCode;
  String? get selectedCourseId => _selectedCourseId;
  String? get autoLoginToken => _autoLoginToken;
  bool? get isInstituteEnrolled => _isInstituteEnrolled;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['profilePic'] = _profilePic;
    map['mobileNumber'] = _mobileNumber;
    map['lastLogin'] = _lastLogin;
    map['referralCount'] = _referralCount;
    map['category'] = _category;
    map['categoryString'] = _categoryString;
    map['dailyTarget'] = _dailyTarget;
    map['initPage'] = _initPage;
    map['depositCoin'] = _depositCoin;
    map['earnedCoin'] = _earnedCoin;
    map['isPromoter'] = _isPromoter;
    map['isPromoterApplied'] = _isPromoterApplied;
    map['isEducator'] = _isEducator;
    map['isEducatorApplied'] = _isEducatorApplied;
    map['isEmailVerified'] = _isEmailVerified;
    map['isMobileVerified'] = _isMobileVerified;
    map['isProfileCompleted'] = _isProfileCompleted;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['emailId'] = _emailId;
    map['language'] = _language;
    map['name'] = _name;
    map['referralCode'] = _referralCode;
    map['selectedCourseId'] = _selectedCourseId;
    map['autoLoginToken'] = _autoLoginToken;
    map['isInstituteEnrolled'] = _isInstituteEnrolled;
    return map;
  }
}
