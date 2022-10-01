class ApiEndPoint {
  static const baseUrl = "https://dharmeshs42.sg-host.com/api/v2/";
  // static const baseUrl = "https://dharmeshs39.sg-host.com/api/v2/";
  static const imgBaseUrl = "https://dharmeshs42.sg-host.com/public/";

  ///*******************endPoints**********************
  static const signUp = "${baseUrl}auth/signup";
  static const getOrders = "${baseUrl}orders/";
  static const signIn = "${baseUrl}auth/login";
  static const conformCode = "${baseUrl}auth/confirm_code";
  static const forgotPassword = "${baseUrl}auth/password/forget_request";
  static const resetPassword = "${baseUrl}auth/password/confirm_reset";
  static const changePassword = "${baseUrl}auth/password/change_password";
  static const getAddress = "${baseUrl}user/shipping/address/";

  static const getPayment = "${baseUrl}payment-types";
  static const deleteCart = "${baseUrl}cart/delete/";
  static const addAddress = "${baseUrl}user/shipping/create";
  static const getWishList = "${baseUrl}wishlists/";
  static const checkWishList = "${baseUrl}wishlists-check-product";
  static const addWishList = "${baseUrl}wishlists-add-product";
  static const removeWishList = "${baseUrl}wishlists-remove-product";
  // static const resetPassword = "${baseUrl}/get-user-by-access_token";

  static const homeAllCenterCategory = "${baseUrl}categories/featured";
  static const homeTopCategory = "${baseUrl}categories/top";
  static const allCategoryProduct = "${baseUrl}categories";
  static const allCategoryProductBottom = "${baseUrl}categories/top";
  static const homeBanner = "${baseUrl}banners";
  static const homeSlider = "${baseUrl}sliders";
  static const addToCart = "${baseUrl}carts/add";
  static const cartList = "${baseUrl}carts/";
  static const profileDetail = "${baseUrl}user/info/";
  static const updateProfile = "${baseUrl}profile/update";
  static const profileImageUpdate = "${baseUrl}profile/update-image";
  static const getcampign = "${baseUrl}get_campaigns";

  static const postQuery = "${baseUrl}auth/signup";

  ///cart
  static const updareCart = "${baseUrl}carts/process";

  /// address
  static const getCountries = "${baseUrl}countries";
  static const getStateByCountries = "${baseUrl}states-by-country/";
  static const getCitiesByStates = "${baseUrl}cities-by-state/";
  static const getState = "${baseUrl}states";
  static const updateAddss = "${baseUrl}user/shipping/update";
  static const deleteAddress = "${baseUrl}user/shipping/delete/";

  static const cartSummary = "${baseUrl}cart-summary/";

  static var plaeOrder = "${baseUrl}order/store";
  static var applyCoupen = "${baseUrl}coupon-apply";

  ///todayProductDeal
  static const todayProductDeal = "${baseUrl}products/todays-deal";
}
