class Urls {
  static const _baseUrl = 'http://ecom-api.teamrabbil.com/api';

  //Users
  static loginUrl(String email) => "$_baseUrl/UserLogin/$email";
  static verifyLogin({required String email, required String otp}) =>
      "$_baseUrl/VerifyLogin/$email/$otp";
  static const createProfile = "$_baseUrl/CreateProfile";
  static const readProfile = "$_baseUrl/ReadProfile";

  //Brands
  static const brandList = "$_baseUrl/BrandList";

  //Categories
  static const categoryList = "$_baseUrl/CategoryList";

  //Products
  static productListByCategory(int categoryId) =>
      "$_baseUrl/ListProductByCategory/$categoryId";
  static productListByBrand(int brandId) =>
      "$_baseUrl/ListProductByBrand/$brandId";
  static productListByRemark(String remark) =>
      "$_baseUrl/ListProductByRemark/$remark";
  static productDetailById(int productId) =>
      "$_baseUrl/ProductDetailsById/$productId";
  static const listProductSlider = "$_baseUrl/ListProductSlider";

  //WishList
  static const productWishList = "$_baseUrl/ProductWishList";
  static createWishList(int productId) => "$_baseUrl/CreateWishList/$productId";
  static deleteWishList(int productId) => "$_baseUrl/RemoveWishList/$productId";

  //Cart
  static const createCartList = "$_baseUrl/CreateCartList";
  static const cartList = "$_baseUrl/CartList";
  static deleteCartList(int productId) => "$_baseUrl/DeleteCartList/$productId";

  // Review
  static const createProductReview = "$_baseUrl/CreateProductReview";
  static listReviewByProduct(int productId) =>
      "$_baseUrl/ListReviewByProduct/$productId";

  //Invoice
  static const createInvoice = "$_baseUrl/InvoiceCreate";
  static const listInvoice = "$_baseUrl/InvoiceList";
  static invoiceProductList(int invoiceId) =>
      "$_baseUrl/InvoiceProductList/$invoiceId";
}
