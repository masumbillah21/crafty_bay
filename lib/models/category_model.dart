class CategoryModel {
  int? id;
  String? categoryName;
  String? categoryImg;

  CategoryModel({
    this.id,
    this.categoryName,
    this.categoryImg,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    categoryImg = json['categoryImg'];
  }
}
