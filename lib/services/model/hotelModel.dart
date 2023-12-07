class HotelData {
  int? status;
  String? message;
  List<Categories>? categories;
  List<Restaurants>? restaurants;
  List<PopularRestaurants>? popularRestaurants;

  HotelData(
      {this.status,
      this.message,
      this.categories,
      this.restaurants,
      });

  HotelData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['restaurants'] != null) {
      restaurants = <Restaurants>[];
      json['restaurants'].forEach((v) {
        restaurants!.add(new Restaurants.fromJson(v));
      });
    }
    if (json['popular_restaurants'] != null) {
      popularRestaurants = <PopularRestaurants>[];
      json['popular_restaurants'].forEach((v) {
        popularRestaurants!.add(new PopularRestaurants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.restaurants != null) {
      data['restaurants'] = this.restaurants!.map((v) => v.toJson()).toList();
    }
    if (this.popularRestaurants != null) {
      data['popular_restaurants'] =
          this.popularRestaurants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? isActive;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;

  Categories(
      {this.id,
      this.name,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}




class Restaurants {
  int? id;
  int? categoryId;
  String? name;
  String? address;
  String? rating;
  String? ratingCount;
  String? distance;
  String? deliveryTime;
  String? type;
  String? coverImage;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;

  Restaurants(
      {this.id,
      this.categoryId,
      this.name,
      this.address,
      this.rating,
      this.ratingCount,
      this.distance,
      this.deliveryTime,
      this.type,
      this.coverImage,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Restaurants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    address = json['address'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    distance = json['distance'];
    deliveryTime = json['delivery_time'];
    type = json['type'];
    coverImage = json['cover_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['rating'] = this.rating;
    data['rating_count'] = this.ratingCount;
    data['distance'] = this.distance;
    data['delivery_time'] = this.deliveryTime;
    data['type'] = this.type;
    data['cover_image'] = this.coverImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class PopularRestaurants {
  int? id;
  int? categoryId;
  String? name;
  String? address;
  String? rating;
  String? ratingCount;
  String? distance;
  String? deliveryTime;
  String? type;
  String? coverImage;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;

  PopularRestaurants(
      {this.id,
      this.categoryId,
      this.name,
      this.address,
      this.rating,
      this.ratingCount,
      this.distance,
      this.deliveryTime,
      this.type,
      this.coverImage,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  PopularRestaurants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    address = json['address'];
    rating = json['rating'];
    ratingCount = json['rating_count'];
    distance = json['distance'];
    deliveryTime = json['delivery_time'];
    type = json['type'];
    coverImage = json['cover_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['rating'] = this.rating;
    data['rating_count'] = this.ratingCount;
    data['distance'] = this.distance;
    data['delivery_time'] = this.deliveryTime;
    data['type'] = this.type;
    data['cover_image'] = this.coverImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

