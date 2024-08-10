import 'package:flutter/material.dart';

import 'features/favourite/favourite_screen.dart';
import 'features/map/data/model/hub_model.dart';
import 'features/map/presentation/view/map_screen.dart';
import 'features/thank_you/thank_you_screen.dart';

List<Widget> widgetOptions(HubModel hub, String categoryName) => <Widget>[
      MapScreen(hub: hub, categoryName: categoryName),
      FavoriteScreen(),
      Text('Walls'),
      Text('Offers'),
      ThankYouScreen(),
    ];
