class AppUrl {
   static const String baseUrl = "https://rideshare.devscape.online/api/v1";
   //post
  static const String signUp = "auth/register";
 static const String getAllHubs = "hubs?";
 static const String getAllCategories = "bicycle/bicycles-categories";
  static const String getBicyclesByCategory = "bicycle/bicycles-by-category";
  //post
  static const String makeReservation = "reservation";

// id
// bicycleCategory 

  static const String getHubContent = "hub-content/";

   
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
