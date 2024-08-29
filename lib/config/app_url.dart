class AppUrl {
  static const String baseUrl = "https://rideshare.devscape.online/api/v1";
  static const String signUp = "auth/register";
  static const String logIn = "auth/authenticate";
  static const String changepassword = "users/change-password";

  static const String policy = "policy";

  static const String getAllHubs = "hubs?";
  static const String getAllCategories = "bicycle/bicycles-categories";
  static const String getBicyclesByCategory = "bicycle/bicycles-by-category";
  static const String makeReservation = "reservation";
  static const String getHubContent = "hub-content";
  //post
  static const String getWalletInfo = "wallet";
  static const String addMoneyToWallet = "wallet";
  //PUT
//Add money to my wallet by code
// {
//   "code": "string"
// }
  static const String createWallet = "wallet";

//POST
// {
//   "securityCode": "string",
//   "confirmSecurityCode": "string",
//   "bankAccount": "string"
// }

  static const String getValidCodes = "wallet/All-valid-codes";
}
