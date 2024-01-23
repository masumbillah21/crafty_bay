class Urls {
  static const baseUrl = 'https://craftybay.teamrabbil.com/api';

  //Users
  static loginUrl(String email) => "$baseUrl/UserLogin/$email";
  static verifyLogin({required String email, required String otp}) =>
      "$baseUrl/VerifyLogin/$email/$otp";
  static const createProfile = "$baseUrl/CreateProfile";
  static const readProfile = "$baseUrl/ReadProfile";

  //Brands
  static const brandList = "$baseUrl/BrandList";

  //Categories
  static const categoryList = "$baseUrl/CategoryList";

  //Products
  static productListByCategory(int categoryId) =>
      "$baseUrl/ListProductByCategory/$categoryId";
  static productListByBrand(int brandId) =>
      "$baseUrl/ListProductByBrand/$brandId";
  static productListByRemark(String remark) =>
      "$baseUrl/ListProductByRemark/$remark";
  static productDetailById(int productId) =>
      "$baseUrl/ProductDetailsById/$productId";
  static const listProductSlider = "$baseUrl/ListProductSlider";

  //WishList
  static const productWishList = "$baseUrl/ProductWishList";
  static createWishList(int productId) => "$baseUrl/CreateWishList/$productId";

  //Cart
  static const createCartList = "$baseUrl/CreateCartList";
  static const cartList = "$baseUrl/CartList";
  static deleteCartList(String productId) =>
      "$baseUrl/DeleteCartList/$productId";

  // Review
  static const createProductReview = "$baseUrl/CreateProductReview";
  static listReviewByProduct(String productId) =>
      "$baseUrl/ListReviewByProduct/$productId";
}
