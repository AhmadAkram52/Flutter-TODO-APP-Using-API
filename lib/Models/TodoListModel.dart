/// code : 200
/// success : true
/// timestamp : 1702395159745
/// message : "Paginated Response"
/// items : [{"_id":"65784ca3a3bd83b088b3b01b","title":"frist","description":"First","is_completed":true,"created_at":"2023-12-12T12:05:55.507Z","updated_at":"2023-12-12T12:05:55.507Z"}]
/// meta : {"total_items":1,"total_pages":1,"per_page_item":10,"current_page":1,"page_size":1,"has_more_page":false}

class TodoListModel {
  TodoListModel({
      num? code, 
      bool? success, 
      num? timestamp, 
      String? message, 
      List<Items>? items, 
      Meta? meta,}){
    _code = code;
    _success = success;
    _timestamp = timestamp;
    _message = message;
    _items = items;
    _meta = meta;
}

  TodoListModel.fromJson(dynamic json) {
    _code = json['code'];
    _success = json['success'];
    _timestamp = json['timestamp'];
    _message = json['message'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  num? _code;
  bool? _success;
  num? _timestamp;
  String? _message;
  List<Items>? _items;
  Meta? _meta;
TodoListModel copyWith({  num? code,
  bool? success,
  num? timestamp,
  String? message,
  List<Items>? items,
  Meta? meta,
}) => TodoListModel(  code: code ?? _code,
  success: success ?? _success,
  timestamp: timestamp ?? _timestamp,
  message: message ?? _message,
  items: items ?? _items,
  meta: meta ?? _meta,
);
  num? get code => _code;
  bool? get success => _success;
  num? get timestamp => _timestamp;
  String? get message => _message;
  List<Items>? get items => _items;
  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['success'] = _success;
    map['timestamp'] = _timestamp;
    map['message'] = _message;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    return map;
  }

}

/// total_items : 1
/// total_pages : 1
/// per_page_item : 10
/// current_page : 1
/// page_size : 1
/// has_more_page : false

class Meta {
  Meta({
      num? totalItems, 
      num? totalPages, 
      num? perPageItem, 
      num? currentPage, 
      num? pageSize, 
      bool? hasMorePage,}){
    _totalItems = totalItems;
    _totalPages = totalPages;
    _perPageItem = perPageItem;
    _currentPage = currentPage;
    _pageSize = pageSize;
    _hasMorePage = hasMorePage;
}

  Meta.fromJson(dynamic json) {
    _totalItems = json['total_items'];
    _totalPages = json['total_pages'];
    _perPageItem = json['per_page_item'];
    _currentPage = json['current_page'];
    _pageSize = json['page_size'];
    _hasMorePage = json['has_more_page'];
  }
  num? _totalItems;
  num? _totalPages;
  num? _perPageItem;
  num? _currentPage;
  num? _pageSize;
  bool? _hasMorePage;
Meta copyWith({  num? totalItems,
  num? totalPages,
  num? perPageItem,
  num? currentPage,
  num? pageSize,
  bool? hasMorePage,
}) => Meta(  totalItems: totalItems ?? _totalItems,
  totalPages: totalPages ?? _totalPages,
  perPageItem: perPageItem ?? _perPageItem,
  currentPage: currentPage ?? _currentPage,
  pageSize: pageSize ?? _pageSize,
  hasMorePage: hasMorePage ?? _hasMorePage,
);
  num? get totalItems => _totalItems;
  num? get totalPages => _totalPages;
  num? get perPageItem => _perPageItem;
  num? get currentPage => _currentPage;
  num? get pageSize => _pageSize;
  bool? get hasMorePage => _hasMorePage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_items'] = _totalItems;
    map['total_pages'] = _totalPages;
    map['per_page_item'] = _perPageItem;
    map['current_page'] = _currentPage;
    map['page_size'] = _pageSize;
    map['has_more_page'] = _hasMorePage;
    return map;
  }

}

/// _id : "65784ca3a3bd83b088b3b01b"
/// title : "frist"
/// description : "First"
/// is_completed : true
/// created_at : "2023-12-12T12:05:55.507Z"
/// updated_at : "2023-12-12T12:05:55.507Z"

class Items {
  Items({
      String? id, 
      String? title, 
      String? description, 
      bool? isCompleted, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _description = description;
    _isCompleted = isCompleted;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Items.fromJson(dynamic json) {
    _id = json['_id'];
    _title = json['title'];
    _description = json['description'];
    _isCompleted = json['is_completed'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _title;
  String? _description;
  bool? _isCompleted;
  String? _createdAt;
  String? _updatedAt;
Items copyWith({  String? id,
  String? title,
  String? description,
  bool? isCompleted,
  String? createdAt,
  String? updatedAt,
}) => Items(  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
  isCompleted: isCompleted ?? _isCompleted,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get title => _title;
  String? get description => _description;
  bool? get isCompleted => _isCompleted;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['is_completed'] = _isCompleted;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}