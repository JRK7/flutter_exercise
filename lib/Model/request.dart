// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class SearchProductRequest {
  const SearchProductRequest({
    required this.userCurrency,
    this.userCountry,
    this.filter,
    this.sort,
  });

  final String userCurrency;
  final String? userCountry;
  final Filters? filter;
  final String? sort;

  SearchProductRequest copyWith({
    String? userCurrency,
    String? userCountry,
    Filters? filter,
    String? sort,
  }) {
    return SearchProductRequest(
      userCurrency: userCurrency ?? this.userCurrency,
      userCountry: userCountry ?? this.userCountry,
      filter: filter ?? this.filter,
      sort: sort ?? this.sort,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userCurrency': userCurrency,
      'userCountry': userCountry,
      'filter': filter?.toMap(),
      'sort': sort,
    };
  }

  factory SearchProductRequest.fromMap(Map<String, dynamic> map) {
    return SearchProductRequest(
      userCurrency: map['userCurrency'] as String,
      userCountry:
          map['userCountry'] != null ? map['userCountry'] as String : null,
      filter: map['filter'] != null
          ? Filters.fromMap(map['filter'] as Map<String, dynamic>)
          : null,
      sort: map['sort'] != null ? map['sort'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchProductRequest.fromJson(String source) =>
      SearchProductRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SearchProductRequest(userCurrency: $userCurrency, userCountry: $userCountry, filter: $filter, sort: $sort)';
  }

  @override
  bool operator ==(covariant SearchProductRequest other) {
    if (identical(this, other)) return true;

    return other.userCurrency == userCurrency &&
        other.userCountry == userCountry &&
        other.filter == filter &&
        other.sort == sort;
  }

  @override
  int get hashCode {
    return userCurrency.hashCode ^
        userCountry.hashCode ^
        filter.hashCode ^
        sort.hashCode;
  }
}

class Filters {
  const Filters({
    this.limit,
    this.shouldFilterByIsBuyNow,
    this.defaultVariantOnly,
    this.currentPage,
    this.source,
    this.isBestSeller,
    this.storeName,
    this.provider,
    this.campaign,
    this.page,
    this.keyword,
    this.supplierCompanyId,
    this.price,
    this.categorySlug,
    this.selectedCategorySlug,
    this.categoryIds,
    this.attributes,
    this.supplierInfo,
  });

  final int? limit;
  final bool? shouldFilterByIsBuyNow;
  final bool? defaultVariantOnly;
  final int? currentPage;
  final String? source;
  final bool? isBestSeller;
  final String? storeName;
  final String? provider;
  final String? campaign;
  final String? page;
  final String? keyword;
  final List<String>? supplierCompanyId;
  final FilterPrice? price;
  final String? categorySlug;
  final String? selectedCategorySlug;
  final List<String>? categoryIds;
  final Map<String, dynamic>? attributes;
  final Map<String, dynamic>? supplierInfo;

  Filters copyWith({
    int? limit,
    bool? shouldFilterByIsBuyNow,
    bool? defaultVariantOnly,
    int? currentPage,
    String? source,
    bool? isBestSeller,
    String? storeName,
    String? provider,
    String? campaign,
    String? page,
    String? keyword,
    List<String>? supplierCompanyId,
    FilterPrice? price,
    String? categorySlug,
    String? selectedCategorySlug,
    List<String>? categoryIds,
    Map<String, dynamic>? attributes,
    Map<String, dynamic>? supplierInfo,
  }) {
    return Filters(
      limit: limit ?? this.limit,
      shouldFilterByIsBuyNow:
          shouldFilterByIsBuyNow ?? this.shouldFilterByIsBuyNow,
      defaultVariantOnly: defaultVariantOnly ?? this.defaultVariantOnly,
      currentPage: currentPage ?? this.currentPage,
      source: source ?? this.source,
      isBestSeller: isBestSeller ?? this.isBestSeller,
      storeName: storeName ?? this.storeName,
      provider: provider ?? this.provider,
      campaign: campaign ?? this.campaign,
      page: page ?? this.page,
      keyword: keyword ?? this.keyword,
      supplierCompanyId: supplierCompanyId ?? this.supplierCompanyId,
      price: price ?? this.price,
      categorySlug: categorySlug ?? this.categorySlug,
      selectedCategorySlug: selectedCategorySlug ?? this.selectedCategorySlug,
      categoryIds: categoryIds ?? this.categoryIds,
      attributes: attributes ?? this.attributes,
      supplierInfo: supplierInfo ?? this.supplierInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'limit': limit,
      'shouldFilterByIsBuyNow': shouldFilterByIsBuyNow,
      'defaultVariantOnly': defaultVariantOnly,
      'currentPage': currentPage,
      'source': source,
      'isBestSeller': isBestSeller,
      'storeName': storeName,
      'provider': provider,
      'campaign': campaign,
      'page': page,
      'keyword': keyword,
      'supplierCompanyId': supplierCompanyId,
      'price': price?.toMap(),
      'categorySlug': categorySlug,
      'selectedCategorySlug': selectedCategorySlug,
      'categoryIds': categoryIds,
      'attributes': attributes,
      'supplierInfo': supplierInfo,
    };
  }

  factory Filters.fromMap(Map<String, dynamic> map) {
    return Filters(
      limit: map['limit'] != null ? map['limit'] as int : null,
      shouldFilterByIsBuyNow: map['shouldFilterByIsBuyNow'] != null
          ? map['shouldFilterByIsBuyNow'] as bool
          : null,
      defaultVariantOnly: map['defaultVariantOnly'] != null
          ? map['defaultVariantOnly'] as bool
          : null,
      currentPage:
          map['currentPage'] != null ? map['currentPage'] as int : null,
      source: map['source'] != null ? map['source'] as String : null,
      isBestSeller:
          map['isBestSeller'] != null ? map['isBestSeller'] as bool : null,
      storeName: map['storeName'] != null ? map['storeName'] as String : null,
      provider: map['provider'] != null ? map['provider'] as String : null,
      campaign: map['campaign'] != null ? map['campaign'] as String : null,
      page: map['page'] != null ? map['page'] as String : null,
      keyword: map['keyword'] != null ? map['keyword'] as String : null,
      supplierCompanyId: map['supplierCompanyId'] != null
          ? List<String>.from((map['supplierCompanyId'] as List<String>))
          : null,
      price: map['price'] != null
          ? FilterPrice.fromMap(map['price'] as Map<String, dynamic>)
          : null,
      categorySlug:
          map['categorySlug'] != null ? map['categorySlug'] as String : null,
      selectedCategorySlug: map['selectedCategorySlug'] != null
          ? map['selectedCategorySlug'] as String
          : null,
      categoryIds: map['categoryIds'] != null
          ? List<String>.from((map['categoryIds'] as List<String>))
          : null,
      attributes: map['attributes'] != null
          ? Map<String, dynamic>.from(
              (map['attributes'] as Map<String, dynamic>))
          : null,
      supplierInfo: map['supplierInfo'] != null
          ? Map<String, dynamic>.from(
              (map['supplierInfo'] as Map<String, dynamic>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Filters.fromJson(String source) =>
      Filters.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Filters(limit: $limit, shouldFilterByIsBuyNow: $shouldFilterByIsBuyNow, defaultVariantOnly: $defaultVariantOnly, currentPage: $currentPage, source: $source, isBestSeller: $isBestSeller, storeName: $storeName, provider: $provider, campaign: $campaign, page: $page, keyword: $keyword, supplierCompanyId: $supplierCompanyId, price: $price, categorySlug: $categorySlug, selectedCategorySlug: $selectedCategorySlug, categoryIds: $categoryIds, attributes: $attributes, supplierInfo: $supplierInfo)';
  }

  @override
  bool operator ==(covariant Filters other) {
    if (identical(this, other)) return true;

    return other.limit == limit &&
        other.shouldFilterByIsBuyNow == shouldFilterByIsBuyNow &&
        other.defaultVariantOnly == defaultVariantOnly &&
        other.currentPage == currentPage &&
        other.source == source &&
        other.isBestSeller == isBestSeller &&
        other.storeName == storeName &&
        other.provider == provider &&
        other.campaign == campaign &&
        other.page == page &&
        other.keyword == keyword &&
        listEquals(other.supplierCompanyId, supplierCompanyId) &&
        other.price == price &&
        other.categorySlug == categorySlug &&
        other.selectedCategorySlug == selectedCategorySlug &&
        listEquals(other.categoryIds, categoryIds) &&
        mapEquals(other.attributes, attributes) &&
        mapEquals(other.supplierInfo, supplierInfo);
  }

  @override
  int get hashCode {
    return limit.hashCode ^
        shouldFilterByIsBuyNow.hashCode ^
        defaultVariantOnly.hashCode ^
        currentPage.hashCode ^
        source.hashCode ^
        isBestSeller.hashCode ^
        storeName.hashCode ^
        provider.hashCode ^
        campaign.hashCode ^
        page.hashCode ^
        keyword.hashCode ^
        supplierCompanyId.hashCode ^
        price.hashCode ^
        categorySlug.hashCode ^
        selectedCategorySlug.hashCode ^
        categoryIds.hashCode ^
        attributes.hashCode ^
        supplierInfo.hashCode;
  }
}

class FilterPrice {
  const FilterPrice({
    this.min,
    this.max,
  });

  final double? min;
  final double? max;

  FilterPrice copyWith({
    double? min,
    double? max,
  }) {
    return FilterPrice(
      min: min ?? this.min,
      max: max ?? this.max,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'min': min,
      'max': max,
    };
  }

  factory FilterPrice.fromMap(Map<String, dynamic> map) {
    return FilterPrice(
      min: map['min'] != null ? map['min'] as double : null,
      max: map['max'] != null ? map['max'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FilterPrice.fromJson(String source) =>
      FilterPrice.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FilterPrice(min: $min, max: $max)';

  @override
  bool operator ==(covariant FilterPrice other) {
    if (identical(this, other)) return true;

    return other.min == min && other.max == max;
  }

  @override
  int get hashCode => min.hashCode ^ max.hashCode;
}
