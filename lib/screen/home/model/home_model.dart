class HomeModel {
  int? id;
  String? title, description, category, image;
  num? price;
  RatingModel? ratingModel;

  HomeModel(
      {this.id,
      this.title,
      this.description,
      this.category,
      this.image,
      this.price,
      this.ratingModel});

  factory HomeModel.mapToModel(Map m1) {
    return HomeModel(
      id: m1['id'],
      title: m1['title'],
      description: m1['description'],
      category: m1['category'],
      image: m1['image'],
      price: m1['price'],
      ratingModel: RatingModel.mapToModel(m1['rating']),
    );
  }
}

class RatingModel {
  num? rate;
  int? count;

  RatingModel({this.rate, this.count});

  factory RatingModel.mapToModel(Map m1) {
    return RatingModel(
      rate: m1['rate'],
      count: m1['count'],
    );
  }
}
