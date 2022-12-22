class BestSellerBookModel {
  BestSellerBookModel({
    required this.status,
    required this.copyright,
    required this.numResults,
    required this.lastModified,
    required this.results,
  });
  late final String? status;
  late final String? copyright;
  late final int? numResults;
  late final String? lastModified;
  late final List<Results>? results;
  
  BestSellerBookModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    copyright = json['copyright'];
    numResults = json['num_results'];
    lastModified = json['last_modified'];
    results = List.from(json['results']).map((e)=>Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['copyright'] = copyright;
    data['num_results'] = numResults;
    data['last_modified'] = lastModified;
    data['results'] = results!.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Results {
  Results({
    required this.listName,
    required this.displayName,
    required this.bestsellersDate,
    required this.publishedDate,
    required this.rank,
    required this.rankLastWeek,
    required this.weeksOnList,
    required this.asterisk,
    required this.dagger,
    required this.amazonProductUrl,
    required this.isbns,
    required this.bookDetails,
    required this.reviews,
  });
  late final String? listName;
  late final String? displayName;
  late final String? bestsellersDate;
  late final String? publishedDate;
  late final int? rank;
  late final int? rankLastWeek;
  late final int? weeksOnList;
  late final int? asterisk;
  late final int? dagger;
  late final String? amazonProductUrl;
  late final List<Isbns>? isbns;
  late final List<BookDetails>? bookDetails;
  late final List<Reviews>? reviews;
  
  Results.fromJson(Map<String, dynamic> json){
    listName = json['list_name'];
    displayName = json['display_name'];
    bestsellersDate = json['bestsellers_date'];
    publishedDate = json['published_date'];
    rank = json['rank'];
    rankLastWeek = json['rank_last_week'];
    weeksOnList = json['weeks_on_list'];
    asterisk = json['asterisk'];
    dagger = json['dagger'];
    amazonProductUrl = json['amazon_product_url'];
    isbns = List.from(json['isbns']).map((e)=>Isbns.fromJson(e)).toList();
    bookDetails = List.from(json['book_details']).map((e)=>BookDetails.fromJson(e)).toList();
    reviews = List.from(json['reviews']).map((e)=>Reviews.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['list_name'] = listName;
    data['display_name'] = displayName;
    data['bestsellers_date'] = bestsellersDate;
    data['published_date'] = publishedDate;
    data['rank'] = rank;
    data['rank_last_week'] = rankLastWeek;
    data['weeks_on_list'] = weeksOnList;
    data['asterisk'] = asterisk;
    data['dagger'] = dagger;
    data['amazon_product_url'] = amazonProductUrl;
    data['isbns'] = isbns!.map((e)=>e.toJson()).toList();
    data['book_details'] = bookDetails!.map((e)=>e.toJson()).toList();
    data['reviews'] = reviews!.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Isbns {
  Isbns({
    required this.isbn10,
    required this.isbn13,
  });
  late final String? isbn10;
  late final String? isbn13;
  
  Isbns.fromJson(Map<String, dynamic> json){
    isbn10 = json['isbn10'];
    isbn13 = json['isbn13'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['isbn10'] = isbn10;
    data['isbn13'] = isbn13;
    return data;
  }
}

class BookDetails {
  BookDetails({
    required this.title,
    required this.description,
    required this.contributor,
    required this.author,
    required this.contributorNote,
    required this.price,
    required this.ageGroup,
    required this.publisher,
    required this.primaryIsbn13,
    required this.primaryIsbn10,
  });
  late final String? title;
  late final String? description;
  late final String? contributor;
  late final String? author;
  late final String? contributorNote;
  late final String? price;
  late final String? ageGroup;
  late final String? publisher;
  late final String? primaryIsbn13;
  late final String? primaryIsbn10;
  
  BookDetails.fromJson(Map<String, dynamic> json){
    title = json['title'];
    description = json['description'];
    contributor = json['contributor'];
    author = json['author'];
    contributorNote = json['contributor_note'];
    price = json['price'];
    ageGroup = json['age_group'];
    publisher = json['publisher'];
    primaryIsbn13 = json['primary_isbn13'];
    primaryIsbn10 = json['primary_isbn10'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['contributor'] = contributor;
    data['author'] = author;
    data['contributor_note'] = contributorNote;
    data['price'] = price;
    data['age_group'] = ageGroup;
    data['publisher'] = publisher;
    data['primary_isbn13'] = primaryIsbn13;
    data['primary_isbn10'] = primaryIsbn10;
    return data;
  }
}

class Reviews {
  Reviews({
    required this.bookReviewLink,
    required this.firstChapterLink,
    required this.sundayReviewLink,
    required this.articleChapterLink,
  });
  late final String? bookReviewLink;
  late final String? firstChapterLink;
  late final String? sundayReviewLink;
  late final String? articleChapterLink;
  
  Reviews.fromJson(Map<String, dynamic> json){
    bookReviewLink = json['book_review_link'];
    firstChapterLink = json['first_chapter_link'];
    sundayReviewLink = json['sunday_review_link'];
    articleChapterLink = json['article_chapter_link'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['book_review_link'] = bookReviewLink;
    data['first_chapter_link'] = firstChapterLink;
    data['sunday_review_link'] = sundayReviewLink;
    data['article_chapter_link'] = articleChapterLink;
    return data;
  }
}