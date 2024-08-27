import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/helper/indicator.dart';
import '../../../../core/resources/managers/colors_manager.dart';
import '../../../../injection_file.dart';
import '../../../../main.dart';
import '../../data/model/hub_model.dart';
import '../../data/model/hubinfo_model.dart';
import '../hub_bloc/hub_bloc.dart';

class CategoryArguments {
  final String categoryName;
  final HubinfoModel hubId;
  final HubinfoModel hubIdto;

  CategoryArguments(
      {required this.categoryName, required this.hubIdto, required this.hubId});
}

class MapScreen extends StatelessWidget {
  MapScreen({
    super.key,
    required this.hub,
    required this.categoryName,
  });
  String categoryName;
  final HubModel hub;
  List<HubinfoModel> listhub = [];

  int istwo = 0;
  final ValueNotifier<List<Marker>> markersNotifier =
      ValueNotifier<List<Marker>>([]);
  final ValueNotifier<List<Polyline>> polylinesNotifier =
      ValueNotifier<List<Polyline>>([]);

  LatLng get Locationcurr => LatLng(hub.latitude, hub.longtitude);

  void fetchHubs(List<HubinfoModel> data) {
    final markers = data.map<Marker>((hubs) {
      return getHubMarker(hubs);
    }).toList();

    markers.add(
      Marker(
        // width: 80.0,
        // height: 80.0,
        point: Locationcurr,
        child: Container(
          child: Icon(
            Icons.my_location,
            color: Colors.blue,
            size: screenWidth * 0.05,
          ),
        ),
      ),
    );

    markersNotifier.value = markers;

    final polylines = data.map<Polyline>((hubs) {
      return Polyline(
        points: [Locationcurr, LatLng(hubs.latitude, hubs.longitude)],
        strokeWidth: 1.0,
        color: Colors.blue.withOpacity(0.5),
      );
    }).toList();

    polylinesNotifier.value = polylines;
  }

  Marker getHubMarker(HubinfoModel hubs) {
    return Marker(
      point: LatLng(hubs.latitude, hubs.longitude),
      child: Builder(builder: (context) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: screenWidth * 0.03,
                ),
                onTap: () {
                  print("nnnnnnnnnnnnnn");
                  print(categoryName);
                  print(hubs.id);
                  listhub.add(hubs);
                  istwo++;
                  if (istwo == 2) {
                    print(listhub.first);
                    print(listhub.last);

                    Navigator.pushNamed(context, '/BicyclesFromCategorey',
                        arguments: CategoryArguments(
                            hubId: listhub.first,
                            hubIdto: listhub.last,
                            categoryName: categoryName));
                    listhub = [];
                  }
                },
              ),
              Text(
                hubs.name,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: screenWidth * 0.01,
                  color: ColorManager.titleNotificationColor,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HubBloc(sl()),
      child: BlocBuilder<HubBloc, HubClassState>(
        builder: (context, state) {
          if (state is InitialStatehub) {
            context.read<HubBloc>().add(HubEvent(hub));
          }
          if (state is HubSuccessState) {
            fetchHubs(state.data.data);
            return Scaffold(
              body: ValueListenableBuilder<List<Marker>>(
                valueListenable: markersNotifier,
                builder: (context, markers, child) {
                  return ValueListenableBuilder<List<Polyline>>(
                    valueListenable: polylinesNotifier,
                    builder: (context, polylines, child) {
                      return FlutterMap(
                        options: MapOptions(
                          initialCenter: Locationcurr,
                          initialZoom: 13.0,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                            subdomains: const ['a', 'b', 'c'],
                          ),
                          // PolylineLayer(
                          //   polylines: polylines,
                          // ),
                          MarkerLayer(
                            markers: markers,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            );
          } else if (state is FailureStatehub) {
            return Scaffold(
              body: Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                ),
              ),
            );
          }

          return const Center(child: Indicator());
        },
      ),
    );
  }
}
