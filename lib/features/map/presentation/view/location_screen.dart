import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:ride_application/core/resources/managers/assets_manager.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';
import 'package:ride_application/core/resources/managers/strings_manager.dart';
import 'package:ride_application/core/widgets/app_button.dart';
import 'package:ride_application/features/map/presentation/view/home_screen.dart';
import 'package:ride_application/main.dart';

import '../../data/model/hub_model.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({super.key, required this.categoryName});
  String categoryName;
  final Location location = Location();
  final LatLng damascusLocation = LatLng(33.5138, 36.2765);

  final ValueNotifier<HubModel?> hubNotifier = ValueNotifier<HubModel?>(null);
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier<bool>(false);

  Future<void> getLocation(BuildContext context) async {
    isLoadingNotifier.value = true;

    LocationData locationData = await location.getLocation();
    hubNotifier.value = HubModel(
      latitude: locationData.latitude!,
      longtitude: locationData.longitude!,
    );

    isLoadingNotifier.value = false;

    if (hubNotifier.value != null) {
      Navigator.pushNamed(
        context,
        '/HomeScreen',
        arguments: HomeScreenArguments(
            categoryName: categoryName, hub: hubNotifier.value!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: hubNotifier.value != null
                  ? LatLng(hubNotifier.value!.latitude,
                      hubNotifier.value!.longtitude)
                  : damascusLocation,
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
              if (hubNotifier.value != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      width: screenWidth * 0.04,
                      height: screenHeight * 0.04,
                      point: LatLng(hubNotifier.value!.latitude,
                          hubNotifier.value!.longtitude),
                      child: Container(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: screenWidth * 0.04,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          Center(
            child: ValueListenableBuilder<bool>(
              valueListenable: isLoadingNotifier,
              builder: (context, isLoading, _) {
                return isLoading
                    ? CircularProgressIndicator()
                    : Container(
                        width: screenWidth * 0.60,
                        height: screenHeight / 2,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              AssetsManager.locationImage,
                            ),
                            Text(
                              StringsManager.ENABLEYOURLOCATION,
                              style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  color: ColorManager.titleNotificationColor),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              StringsManager.SUBENABLE,
                              style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  color: ColorManager.underHintTextColor),
                              textAlign: TextAlign.center,
                            ),
                            AppButton(
                              textStyle: TextStyle(
                                fontSize: screenWidth * 0.035,
                                color: ColorManager.whiteColor,
                              ),
                              text: StringsManager.USEMYLOCATION,
                              onPressed: () => getLocation(context),
                              backgroundColor: ColorManager.primaryColor,
                              width: screenWidth * 0.50,
                              height: screenHeight / 14,
                              hasIcon: false,
                            ),
                            Text(
                              StringsManager.SKIPFORNOW,
                              style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  color: ColorManager.subTitleColor),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
