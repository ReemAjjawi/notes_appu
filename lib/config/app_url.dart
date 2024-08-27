class AppUrl {
  static const String baseUrl = "https://rideshare.devscape.online/api/v1";
  //post
  static const String signUp = "auth/register";
  static const String logIn = "auth/authenticate";
  static const String getAllHubs = "hubs?";
  static const String getAllCategories = "bicycle/bicycles-categories";
  static const String getBicyclesByCategory = "bicycle/bicycles-by-category";
  static const String getHubContent = "hub-content";
  //post
  static const String makeReservation = "reservation";
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

// {
//   "firstName": "string",
//   "lastName": "string",
//   "phone": "stringstri",
//   "username": "string",
//   "birthDate": "2024-08-02",
//   "password": "string",
//   "confirmPassword": "string"
// }

// GET
// /api/v1/hubs
// https://rideshare.devscape.online/api/v1/hubs?longtitude=36.278336&latitude=33.510414

//https://rideshare.devscape.online/api/v1/bicycle/bicycles-by-category?category=Road_bikes

//https://rideshare.devscape.online/api/v1/hub-content/2?bicycleCategory=Mountain_bikes

//

// POST
// /api/v1/reservation
// {
//   "bicycleId": 0,
//   "fromHubId": 0,
//   "toHubId": 0,
//   "duration": 0,
//   "startTime": "2024-08-07T16:47:23.334Z",
//   "endTime": "2024-08-07T16:47:23.334Z",
//   "reservationStatus": "string",
//   "paymentMethod": "Wallet"
// }
