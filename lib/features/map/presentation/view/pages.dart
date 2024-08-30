import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../favourite/favourite_screen.dart';
import '../../../get_wallet/presentation/view/get_wallet_info_screen.dart';
import '../../data/model/hub_model.dart';
import 'map_screen.dart';


List<Widget> widgetOptions(HubModel hub, String categoryName) => <Widget>[
      MapScreen(hub: hub, categoryName: categoryName),
      FavoriteScreen(),
      WalletScreen(),
      Text('Offers'),
      Text("profile"),
    ];
