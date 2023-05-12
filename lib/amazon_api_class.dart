class AmazonTest {
  String? totalProducts;
  String? category;
  List<Result>? result;

  AmazonTest({this.totalProducts, this.category, this.result});

  AmazonTest.fromJson(Map<String, dynamic> json) {
    totalProducts = json['totalProducts'];
    category = json['category'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['totalProducts'] = totalProducts;
    data['category'] = category;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  Position? position;
  String? asin;
  Price? price;
  Reviews? reviews;
  String? url;
  String? score;
  bool? sponsored;
  bool? amazonChoice;
  bool? bestSeller;
  bool? amazonPrime;
  String? title;
  String? thumbnail;

  Result(
      {this.position,
      this.asin,
      this.price,
      this.reviews,
      this.url,
      this.score,
      this.sponsored,
      this.amazonChoice,
      this.bestSeller,
      this.amazonPrime,
      this.title,
      this.thumbnail});

  Result.fromJson(Map<String, dynamic> json) {
    position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
    asin = json['asin'];
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    reviews =
        json['reviews'] != null ? Reviews.fromJson(json['reviews']) : null;
    url = json['url'];
    score = json['score'];
    sponsored = json['sponsored'];
    amazonChoice = json['amazonChoice'];
    bestSeller = json['bestSeller'];
    amazonPrime = json['amazonPrime'];
    title = json['title'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (position != null) {
      data['position'] = position!.toJson();
    }
    data['asin'] = asin;
    if (price != null) {
      data['price'] = price!.toJson();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.toJson();
    }
    data['url'] = url;
    data['score'] = score;
    data['sponsored'] = sponsored;
    data['amazonChoice'] = amazonChoice;
    data['bestSeller'] = bestSeller;
    data['amazonPrime'] = amazonPrime;
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    return data;
  }
}

class Position {
  int? page;
  int? position;
  int? globalPosition;

  Position({this.page, this.position, this.globalPosition});

  Position.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    position = json['position'];
    globalPosition = json['global_position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['page'] = page;
    data['position'] = position;
    data['global_position'] = globalPosition;
    return data;
  }
}

class Price {
  bool? discounted;
  double? currentPrice;
  String? currency;
  double? beforePrice;
  double? savingsAmount;
  double? savingsPercent;

  Price(
      {this.discounted,
      this.currentPrice,
      this.currency,
      this.beforePrice,
      this.savingsAmount,
      this.savingsPercent});

  Price.fromJson(Map<String, dynamic> json) {
    discounted = json['discounted'];
    currentPrice = json['current_price'];
    currency = json['currency'];
    beforePrice = json['before_price'];
    savingsAmount = json['savings_amount'];
    savingsPercent = json['savings_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['discounted'] = discounted;
    data['current_price'] = currentPrice;
    data['currency'] = currency;
    data['before_price'] = beforePrice;
    data['savings_amount'] = savingsAmount;
    data['savings_percent'] = savingsPercent;
    return data;
  }
}

class Reviews {
  int? totalReviews;
  double? rating;

  Reviews({this.totalReviews, this.rating});

  Reviews.fromJson(Map<String, dynamic> json) {
    totalReviews = json['total_reviews'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total_reviews'] = totalReviews;
    data['rating'] = rating;
    return data;
  }
}
