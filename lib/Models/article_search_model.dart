class ArticleSearchModel {
  String? status;
  String? copyright;
  Response? response;

  ArticleSearchModel({
    this.status,
    this.copyright,
    this.response,
  });

  ArticleSearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as String?;
    copyright = json['copyright'] as String?;
    response = (json['response'] as Map<String,dynamic>?) != null ? Response.fromJson(json['response'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status;
    json['copyright'] = copyright;
    json['response'] = response?.toJson();
    return json;
  }
}

class Response {
  List<Docs>? docs;
  Meta? meta;

  Response({
    this.docs,
    this.meta,
  });

  Response.fromJson(Map<String, dynamic> json) {
    docs = (json['docs'] as List?)?.map((dynamic e) => Docs.fromJson(e as Map<String,dynamic>)).toList();
    meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['docs'] = docs?.map((e) => e.toJson()).toList();
    json['meta'] = meta?.toJson();
    return json;
  }
}

class Docs {
  String? abstract;
  String? webUrl;
  String? snippet;
  String? leadParagraph;
  String? printSection;
  String? printPage;
  String? source;
  List<Multimedia>? multimedia;
  Headline? headline;
  List<Keywords>? keywords;
  String? pubDate;
  String? documentType;
  String? newsDesk;
  String? sectionName;
  String? subsectionName;
  Byline? byline;
  String? typeOfMaterial;
  String? id;
  int? wordCount;
  String? uri;

  Docs({
    this.abstract,
    this.webUrl,
    this.snippet,
    this.leadParagraph,
    this.printSection,
    this.printPage,
    this.source,
    this.multimedia,
    this.headline,
    this.keywords,
    this.pubDate,
    this.documentType,
    this.newsDesk,
    this.sectionName,
    this.subsectionName,
    this.byline,
    this.typeOfMaterial,
    this.id,
    this.wordCount,
    this.uri,
  });

  Docs.fromJson(Map<String, dynamic> json) {
    abstract = json['abstract'] as String?;
    webUrl = json['web_url'] as String?;
    snippet = json['snippet'] as String?;
    leadParagraph = json['lead_paragraph'] as String?;
    printSection = json['print_section'] as String?;
    printPage = json['print_page'] as String?;
    source = json['source'] as String?;
    multimedia = (json['multimedia'] as List?)?.map((dynamic e) => Multimedia.fromJson(e as Map<String,dynamic>)).toList();
    headline = (json['headline'] as Map<String,dynamic>?) != null ? Headline.fromJson(json['headline'] as Map<String,dynamic>) : null;
    keywords = (json['keywords'] as List?)?.map((dynamic e) => Keywords.fromJson(e as Map<String,dynamic>)).toList();
    pubDate = json['pub_date'] as String?;
    documentType = json['document_type'] as String?;
    newsDesk = json['news_desk'] as String?;
    sectionName = json['section_name'] as String?;
    subsectionName = json['subsection_name'] as String?;
    byline = (json['byline'] as Map<String,dynamic>?) != null ? Byline.fromJson(json['byline'] as Map<String,dynamic>) : null;
    typeOfMaterial = json['type_of_material'] as String?;
    id = json['_id'] as String?;
    wordCount = json['word_count'] as int?;
    uri = json['uri'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['abstract'] = abstract;
    json['web_url'] = webUrl;
    json['snippet'] = snippet;
    json['lead_paragraph'] = leadParagraph;
    json['print_section'] = printSection;
    json['print_page'] = printPage;
    json['source'] = source;
    json['multimedia'] = multimedia?.map((e) => e.toJson()).toList();
    json['headline'] = headline?.toJson();
    json['keywords'] = keywords?.map((e) => e.toJson()).toList();
    json['pub_date'] = pubDate;
    json['document_type'] = documentType;
    json['news_desk'] = newsDesk;
    json['section_name'] = sectionName;
    json['subsection_name'] = subsectionName;
    json['byline'] = byline?.toJson();
    json['type_of_material'] = typeOfMaterial;
    json['_id'] = id;
    json['word_count'] = wordCount;
    json['uri'] = uri;
    return json;
  }
}

class Multimedia {
  int? rank;
  String? subtype;
  dynamic caption;
  dynamic credit;
  String? type;
  String? url;
  int? height;
  int? width;
  Legacy? legacy;
  String? subType;
  String? cropName;

  Multimedia({
    this.rank,
    this.subtype,
    this.caption,
    this.credit,
    this.type,
    this.url,
    this.height,
    this.width,
    this.legacy,
    this.subType,
    this.cropName,
  });

  Multimedia.fromJson(Map<String, dynamic> json) {
    rank = json['rank'] as int?;
    subtype = json['subtype'] as String?;
    caption = json['caption'];
    credit = json['credit'];
    type = json['type'] as String?;
    url = json['url'] as String?;
    height = json['height'] as int?;
    width = json['width'] as int?;
    legacy = (json['legacy'] as Map<String,dynamic>?) != null ? Legacy.fromJson(json['legacy'] as Map<String,dynamic>) : null;
    subType = json['subType'] as String?;
    cropName = json['crop_name'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['rank'] = rank;
    json['subtype'] = subtype;
    json['caption'] = caption;
    json['credit'] = credit;
    json['type'] = type;
    json['url'] = url;
    json['height'] = height;
    json['width'] = width;
    json['legacy'] = legacy?.toJson();
    json['subType'] = subType;
    json['crop_name'] = cropName;
    return json;
  }
}

class Legacy {
  String? xlarge;
  int? xlargewidth;
  int? xlargeheight;

  Legacy({
    this.xlarge,
    this.xlargewidth,
    this.xlargeheight,
  });

  Legacy.fromJson(Map<String, dynamic> json) {
    xlarge = json['xlarge'] as String?;
    xlargewidth = json['xlargewidth'] as int?;
    xlargeheight = json['xlargeheight'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['xlarge'] = xlarge;
    json['xlargewidth'] = xlargewidth;
    json['xlargeheight'] = xlargeheight;
    return json;
  }
}

class Headline {
  String? main;
  dynamic kicker;
  dynamic contentKicker;
  String? printHeadline;
  dynamic name;
  dynamic seo;
  dynamic sub;

  Headline({
    this.main,
    this.kicker,
    this.contentKicker,
    this.printHeadline,
    this.name,
    this.seo,
    this.sub,
  });

  Headline.fromJson(Map<String, dynamic> json) {
    main = json['main'] as String?;
    kicker = json['kicker'];
    contentKicker = json['content_kicker'];
    printHeadline = json['print_headline'] as String?;
    name = json['name'];
    seo = json['seo'];
    sub = json['sub'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['main'] = main;
    json['kicker'] = kicker;
    json['content_kicker'] = contentKicker;
    json['print_headline'] = printHeadline;
    json['name'] = name;
    json['seo'] = seo;
    json['sub'] = sub;
    return json;
  }
}

class Keywords {
  String? name;
  String? value;
  int? rank;
  String? major;

  Keywords({
    this.name,
    this.value,
    this.rank,
    this.major,
  });

  Keywords.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    value = json['value'] as String?;
    rank = json['rank'] as int?;
    major = json['major'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['value'] = value;
    json['rank'] = rank;
    json['major'] = major;
    return json;
  }
}

class Byline {
  String? original;
  List<Person>? person;
  dynamic organization;

  Byline({
    this.original,
    this.person,
    this.organization,
  });

  Byline.fromJson(Map<String, dynamic> json) {
    original = json['original'] as String?;
    person = (json['person'] as List?)?.map((dynamic e) => Person.fromJson(e as Map<String,dynamic>)).toList();
    organization = json['organization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['original'] = original;
    json['person'] = person?.map((e) => e.toJson()).toList();
    json['organization'] = organization;
    return json;
  }
}

class Person {
  String? firstname;
  dynamic middlename;
  String? lastname;
  dynamic qualifier;
  dynamic title;
  String? role;
  String? organization;
  int? rank;

  Person({
    this.firstname,
    this.middlename,
    this.lastname,
    this.qualifier,
    this.title,
    this.role,
    this.organization,
    this.rank,
  });

  Person.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'] as String?;
    middlename = json['middlename'];
    lastname = json['lastname'] as String?;
    qualifier = json['qualifier'];
    title = json['title'];
    role = json['role'] as String?;
    organization = json['organization'] as String?;
    rank = json['rank'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['firstname'] = firstname;
    json['middlename'] = middlename;
    json['lastname'] = lastname;
    json['qualifier'] = qualifier;
    json['title'] = title;
    json['role'] = role;
    json['organization'] = organization;
    json['rank'] = rank;
    return json;
  }
}

class Meta {
  int? hits;
  int? offset;
  int? time;

  Meta({
    this.hits,
    this.offset,
    this.time,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    hits = json['hits'] as int?;
    offset = json['offset'] as int?;
    time = json['time'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['hits'] = hits;
    json['offset'] = offset;
    json['time'] = time;
    return json;
  }
}