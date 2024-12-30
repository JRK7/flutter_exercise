class ProductInfo {
  final String? supplierCompanyId;
  final num? vatPercentage;
  final Map<String, dynamic>? searchPrices;
  final Map<String, dynamic>? searchPricesWithVat;
  final String? sku;
  final String? soldBy;
  final String? name;
  final Map<String, dynamic>? attributes;
  final String? id;
  final String? imageUrl;
  final num? minOrderQty;
  final num? maxOrderQty;
  final num? stockQty;
  final String? unit;
  final List<String>? tags;
  final bool? isBestSeller;
  final bool? hasVariants;
  final List<String>? categoryIds;
  final V4ListProduct$Packaging? packaging;
  final V4ListProduct$SupplierInfo? productsupplierInfo;

  ProductInfo(
      {this.supplierCompanyId,
      this.vatPercentage,
      this.searchPrices,
      this.searchPricesWithVat,
      this.sku,
      this.soldBy,
      this.name,
      this.attributes,
      this.id,
      this.imageUrl,
      this.minOrderQty,
      this.maxOrderQty,
      this.stockQty,
      this.unit,
      this.tags,
      this.isBestSeller,
      this.hasVariants,
      this.categoryIds,
      this.packaging,
      this.productsupplierInfo});

  factory ProductInfo.fromJson(Map<String, dynamic> json) {
    return ProductInfo(
      supplierCompanyId: json['supplierCompanyId']?.toString(),
      vatPercentage: num.tryParse('${json['vatPercentage']}') ?? 0,
      // searchPrices: json['searchPrices'] != null
      //     ?  Map<String, dynamic>.from(json['searchPrices']) : null,
      searchPrices: json['searchPrices'] != null
          ? (json['searchPrices'] as Map).map(
              (key, value) => MapEntry(key as String, value),
            )
          : null,
      searchPricesWithVat: json['searchPricesWithVat'] != null
          ? (json['searchPricesWithVat'] as Map).map(
              (key, value) => MapEntry(key as String, value),
            )
          : null,
      sku: json['sku']?.toString(),
      soldBy: json['soldBy']?.toString(),
      name: json['name']?.toString(),
      attributes: json['attributes'] != null
          ? (json['attributes'] as Map).map(
              (key, value) => MapEntry(key as String, value),
            )
          : null,
      id: json['id']?.toString(),
      imageUrl: json['imageUrl']?.toString(),
      minOrderQty: num.tryParse('${json['minOrderQty']}') ?? 1,
      maxOrderQty: num.tryParse('${json['maxOrderQty']}'),
      stockQty: num.tryParse('${json['stockQty']}'),
      unit: json['unit']?.toString(),
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      isBestSeller:
          json['isBestSeller']?.toString().toLowerCase().trim() == 'true'
              ? true
              : false,
      hasVariants:
          json['hasVariants']?.toString().toLowerCase().trim() == 'true'
              ? true
              : false,
      categoryIds: json['categoryIds'] != null
          ? List<String>.from(json['categoryIds'])
          : null,
      packaging: json['packaging'] != null
          ? V4ListProduct$Packaging.fromJson(json['packaging'])
          : null,
      productsupplierInfo: json['supplierInfo'] != null
          ? V4ListProduct$SupplierInfo.fromJson(json['supplierInfo'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['supplierCompanyId'] = supplierCompanyId;
    data['vatPercentage'] = vatPercentage;
    data['searchPrices'] = searchPrices;
    data['searchPricesWithVat'] = searchPricesWithVat;
    data['sku'] = sku;
    data['soldBy'] = soldBy;
    data['name'] = name;
    data['attributes'] = attributes;
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['minOrderQty'] = minOrderQty;
    data['maxOrderQty'] = maxOrderQty;
    data['stockQty'] = stockQty;
    data['unit'] = unit;
    data['tags'] = tags;
    data['isBestSeller'] = isBestSeller;
    data['hasVariants'] = hasVariants;
    data['categoryIds'] = categoryIds;
    data['packaging'] = packaging?.toJson();
    return data;
  }
}

class V4ListProduct$Packaging {
  String? size;
  String? unit;
  String? unitsPerCarton;

  V4ListProduct$Packaging({
    this.size,
    this.unit,
    this.unitsPerCarton,
  });

  factory V4ListProduct$Packaging.fromJson(Map<String, dynamic> json) {
    return V4ListProduct$Packaging(
      size: json['size']?.toString(),
      unit: json['unit']?.toString(),
      unitsPerCarton: json['unitsPerCarton']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'size': size,
      'unit': unit,
      'unitsPerCarton': unitsPerCarton,
    };
    return data;
  }
}

class V4ListProduct$SupplierInfo {
  const V4ListProduct$SupplierInfo({
    this.supplierCompanyId,
    this.companyName,
    this.regCountry,
    this.slug,
    this.ratingCount,
    this.id,
    this.establishedYear,
    this.ratingAverage,
    this.subCategories,
    this.mainCategories,
    this.businessType,
  });

  final String? supplierCompanyId;
  final String? companyName;
  final String? regCountry;
  final String? slug;
  final dynamic ratingCount;
  final String? id;
  final dynamic establishedYear;
  final dynamic ratingAverage;
  final List<String>? subCategories;
  final List<String>? mainCategories;
  final List<String>? businessType;

  factory V4ListProduct$SupplierInfo.fromJson(Map<String, dynamic> json) {
    return V4ListProduct$SupplierInfo(
      supplierCompanyId: json['supplierCompanyId']?.toString() ?? '',
      companyName: json['companyName']?.toString() ?? '',
      regCountry: json['regCountry']?.toString() ?? '',
      slug: json['slug']?.toString() ?? '',
      ratingCount: json['ratingCount'],
      id: json['id']?.toString() ?? '',
      establishedYear: json['establishedYear'],
      ratingAverage: json['ratingAverage'],
      subCategories: (json['subCategories'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          <String>[],
      mainCategories: (json['mainCategories'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          <String>[],
      businessType: (json['businessType'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          <String>[],
    );
  }

  Map<String, dynamic> toJson() {
    final val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('supplierCompanyId', supplierCompanyId);
    writeNotNull('companyName', companyName);
    writeNotNull('regCountry', regCountry);
    writeNotNull('slug', slug);
    writeNotNull('ratingCount', ratingCount);
    writeNotNull('id', id);
    writeNotNull('establishedYear', establishedYear);
    writeNotNull('ratingAverage', ratingAverage);
    writeNotNull('subCategories', subCategories);
    writeNotNull('mainCategories', mainCategories);
    writeNotNull('businessType', businessType);
    return val;
  }
}
