import 'package:flutter_exercise/Model/product_info.dart';
import 'package:flutter_exercise/Utils/Extensions/bool.dart';

class SearchResponse {
  String queryId;
  SearchResponseMeta? meta;
  int currentPage;
  int totalPages;
  int totalRecords;
  int pageSize;
  SearchResponseData? data;

  SearchResponse({
    required this.queryId,
    this.meta,
    required this.currentPage,
    required this.totalPages,
    required this.totalRecords,
    required this.pageSize,
    this.data,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return SearchResponse(
      queryId: json['queryId'].toString(),
      meta: json['meta'] != null
          ? SearchResponseMeta.fromJson(json['meta'])
          : null,
      currentPage: int.tryParse('${json['currentPage']}') ?? 0,
      totalPages: int.tryParse('${json['totalPages']}') ?? 0,
      totalRecords: int.tryParse('${json['totalRecords']}') ?? 0,
      pageSize: int.tryParse('${json['pageSize']}') ?? 0,
      data: json['data'] != null
          ? SearchResponseData.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'queryId': queryId,
      'meta': meta?.toJson(),
      'currentPage': currentPage,
      'totalPages': totalPages,
      'totalRecords': totalRecords,
      'pageSize': pageSize,
      'data': data?.toJson(),
    };
  }
}

class SearchResponseMeta {
  String selectedCategorySlug;
  bool isCustomStorePage;
  String storeName;

  SearchResponseMeta({
    required this.selectedCategorySlug,
    required this.isCustomStorePage,
    required this.storeName,
  });

  factory SearchResponseMeta.fromJson(Map<String, dynamic> json) {
    return SearchResponseMeta(
      selectedCategorySlug: json['selectedCategorySlug']?.toString() ?? '',
      isCustomStorePage: json['isCustomStorePage'].toString().parseBool(),
      storeName: json['storeName']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'selectedCategorySlug': selectedCategorySlug,
      'isCustomStorePage': isCustomStorePage,
      'storeName': storeName,
    };
  }
}

class SearchResponseData {
  List<String> sort;
  List<V4CategoryTreeItem> categoryTree;
  List<ProductInfo> products;
  List<V1Filter>? filters;
  String? selectedSorting;
  Map<String, dynamic>? selectedFilters;

  SearchResponseData({
    required this.sort,
    required this.categoryTree,
    required this.products,
    this.filters,
    this.selectedSorting,
    this.selectedFilters,
  });

  factory SearchResponseData.fromJson(Map<String, dynamic> json) {
    return SearchResponseData(
      sort: List<String>.from(json['sort'] is List ? json['sort'] : []),
      categoryTree: json['categoryTree'] != null && json['categoryTree'] is List
          ? (json['categoryTree'] as List<dynamic>)
              .map((item) => V4CategoryTreeItem.fromJson(item))
              .toList()
          : [],
      products: json['products'] != null && json['products'] is List
          ? (json['products'] as List<dynamic>)
              .map((item) => ProductInfo.fromJson(item))
              .toList()
          : [],
      filters: json['filters'] != null && json['filters'] is List
          ? (json['filters'] as List<dynamic>)
              .map((item) => V1Filter.fromJson(item))
              .toList()
          : null,
      selectedSorting: json['selectedSorting'],
      selectedFilters: json['selectedFilters'] != null
          ? Map<String, dynamic>.from(json['selectedFilters'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sort': sort,
      'categoryTree': categoryTree.map((item) => item.toJson()).toList(),
      'products': products.map((item) => item.toJson()).toList(),
      'filters': filters?.map((item) => item.toJson()).toList(),
      'selectedSorting': selectedSorting,
      'selectedFilters': selectedFilters,
    };
  }
}

class V4CategoryTreeItem {
  final int? level;
  final List<String>? children;
  final String? name;
  final String? slug;

  V4CategoryTreeItem({
    this.level,
    this.children,
    this.name,
    this.slug,
  });

  factory V4CategoryTreeItem.fromJson(Map<String, dynamic> json) {
    return V4CategoryTreeItem(
      level: int.tryParse('${json['level']}') ?? 0,
      children: json['children'] != null
          ? List<String>.from(json['children'])
          : <String>[],
      name: json['name']?.toString(),
      slug: json['slug']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'level': level,
      'children': children,
      'name': name,
      'slug': slug,
    };
    return data;
  }
}

class V1Filter {
  String? type;
  String? name;
  String? code;
  List<V1Filter$Data$Item>? data;

  V1Filter({
    this.type,
    this.name,
    this.code,
    this.data,
  });

  factory V1Filter.fromJson(Map<String, dynamic> json) {
    return V1Filter(
      type: json['type']?.toString(),
      name: json['name']?.toString(),
      code: json['code']?.toString(),
      data: json['data'] != null
          ? (json['data'] as List<dynamic>)
              .map((e) => V1Filter$Data$Item.fromJson(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'type': type,
      'name': name,
      'code': code,
      'data': this.data?.map((e) => e.toJson()).toList(),
    };
    return data;
  }
}

class V1Filter$Data$Item {
  double? count;
  String? name;
  bool? selected;
  String? min;
  String? max;
  double? minValue;
  double? maxValue;

  V1Filter$Data$Item({
    this.count,
    this.name,
    this.selected,
    this.min,
    this.max,
    this.minValue,
    this.maxValue,
  });

  factory V1Filter$Data$Item.fromJson(Map<String, dynamic> json) {
    return V1Filter$Data$Item(
      count: double.tryParse('${json['count']}') ?? 0,
      name: json['name']?.toString(),
      selected: json['selected']?.toString().toLowerCase().trim() == 'true'
          ? true
          : false,
      min: json['min']?.toString(),
      max: json['max']?.toString(),
      minValue: double.tryParse('${json['minValue']}') ?? 0,
      maxValue: double.tryParse('${json['maxValue']}') ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'count': count,
      'name': name,
      'selected': selected,
      'min': min,
      'max': max,
      'minValue': minValue,
      'maxValue': maxValue,
    };
    return data;
  }
}
