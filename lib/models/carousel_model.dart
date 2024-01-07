class CarouselModel {
  int? id;
  String? title;
  String? shortDes;
  String? image;
  int? productId;

  CarouselModel({
    this.id,
    this.title,
    this.shortDes,
    this.image,
    this.productId,
  });

  CarouselModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDes = json['short_des'];
    image = json['image'];
    productId = json['product_id'];
  }
}
