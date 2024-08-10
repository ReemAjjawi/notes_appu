import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_application/core/helper/build_app_bar.dart';
import 'package:ride_application/core/resources/managers/assets_manager.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';
import 'package:ride_application/core/resources/managers/strings_manager.dart';
import 'package:ride_application/core/resources/managers/styles_manager.dart';
import 'package:ride_application/core/widgets/app_button.dart';
import 'package:ride_application/core/widgets/app_list_tile.dart';
import 'package:ride_application/core/widgets/app_text_field.dart';
import 'package:ride_application/main.dart';

import '../../../../core/helper/indicator.dart';
import '../../../../core/widgets/success_widget.dart';
import '../../../../injection_file.dart';
import '../../../hub_content/data/model/second_model.dart';
import '../../../hub_content/presentation/view/bicycle_details_screen.dart';
import '../../../map/data/model/hub_model.dart';
import '../../../map/data/model/hubinfo_model.dart';
import '../../data/model/reservation_model.dart';
import '../Reservation_bloc/Reservation_bloc.dart';

class ReservationScreen extends StatelessWidget {
  final BicycleListModel bicycle;
  final HubinfoModel hubId;
  final HubinfoModel hubIdto;

  ReservationScreen({
    Key? key,
    required this.bicycle,
    required this.hubId,
    required this.hubIdto,
  }) : super(key: key);

  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReservationBloc(sl()),
      child: MaterialApp(
        home: Builder(builder: (context) {
          return Scaffold(
            appBar: buildAppBar(
              hasLeading: true,
              title: Text(StringsManager.REQUESTFORRENT),
              onPressed: () => onAppBarPressed(context),
            ),
            body: Form(
                key: _formKey, child: buildBody(screenWidth, screenHeight)),
          );
        }),
      ),
    );
  }

  Widget buildListView(double screenHeight, double screenWidth) {
    final List<Map<String, String>> payment = [
      {
        'Image': AssetsManager.visaImage,
        'name': StringsManager.VISANUMBER,
        'date': StringsManager.SUBVISANUMBER
      },
      {
        'Image': AssetsManager.mastercardImage,
        'name': StringsManager.VISANUMBER,
        'date': StringsManager.SUBVISANUMBER
      },
      {
        'Image': AssetsManager.mailaddressImage,
        'name': StringsManager.MAILADDRESS,
        'date': StringsManager.SUBVISANUMBER
      },
      {
        'Image': AssetsManager.cashImage,
        'name': StringsManager.CASH,
        'date': StringsManager.SUBVISANUMBER
      },
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: payment.length,
        itemBuilder: (context, index) {
          return Card(
            child: CustomListTile(
              leading: Image(image: AssetImage(payment[index]['Image']!)),
              title: Text(payment[index]['name']!,
                  style: StylesManager.titleTextStyle),
              subtitle: Text(payment[index]['date']!,
                  style: StylesManager.subTitleStyle),
              backgroundColor: ColorManager.scondaryColor,
              borderColor: ColorManager.borderColor,
              height: screenHeight * 0.1,
              width: screenWidth,
              hasrawtitle: false,
              hasrawsubtitle: false,
              hascolum: false,
            ),
          );
        },
      ),
    );
  }

  Widget buildBody(double screenWidth, double screenHeight) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomListTile(
        leading: const Icon(
          Icons.location_on,
          color: ColorManager.cancelColor,
        ),
        title: Text(StringsManager.CURRENTLOCATION,
            style: StylesManager.titleTextStyle),
        subtitle: Text(hubId.name, style: StylesManager.subTitleStyle),
        backgroundColor: ColorManager.scondaryColor,
        borderColor: ColorManager.borderColor,
        height: screenHeight * 0.1,
        width: screenWidth,
        hasrawtitle: false,
        hasrawsubtitle: false,
        hascolum: false,
      ),
      buildSizeBox2(screenHeight),
      CustomListTile(
        leading: const Icon(
          Icons.location_on,
          color: ColorManager.borderColor,
        ),
        title: Text(StringsManager.CURRENTLOCATION,
            style: StylesManager.subTitleStyle),
        subtitle: Text(hubIdto.name),
        backgroundColor: ColorManager.scondaryColor,
        borderColor: ColorManager.scondaryColor,
        height: screenHeight * 0.1,
        width: screenWidth,
        hasrawtitle: false,
        hasrawsubtitle: false,
        hascolum: false,
      ),
      buildSizeBox2(screenHeight),
      CustomTextFormField(
        controller: timeController,
        hintText: StringsManager.TIME,
        colorborder: ColorManager.hintTextColor,
        width: screenWidth * 0.88,
        height: screenHeight / 15,
      ),
      buildSizeBox(screenHeight),
      CustomListTile(
        title: Text(bicycle.type, style: StylesManager.titleTextStyle),
        subtitle: Text(bicycle.note, style: StylesManager.subTitleStyle),
        backgroundColor: ColorManager.scondaryColor,
        borderColor: ColorManager.borderColor,
        height: screenHeight * 0.1,
        width: screenWidth,
        hasrawtitle: false,
        hasrawsubtitle: false,
        hascolum: false,
      ),
      buildSizeBox2(screenHeight),
      buildText(),
      buildSizeBox(screenHeight),
      buildListView(screenHeight, screenWidth),
      buildSizeBox2(screenHeight),
      buildSizeBox2(screenHeight),
      Center(
        child: BlocBuilder<ReservationBloc, ReservationClassState>(
          builder: (context, state) {
            if (state is InitialState) {
              return AppButton(
                text: StringsManager.CONFIRMBOOKING,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ReservationModel reservation = ReservationModel(
                        bicycleId: bicycle.id,
                        fromHubId: hubId.id,
                        toHubId: hubIdto.id,
                        duration: int.parse(timeController.text),
                        startTime: "2024-08-09T15:44:48.928Z",
                        endTime: "2024-08-09T15:44:48.928Z",
                        reservationStatus: "New",
                        paymentMethod: "Wallet");
                    context.read<ReservationBloc>().add(
                          ReservationEvent(reservation),
                        );
                  }
                },
                backgroundColor: ColorManager.primaryColor,
                width: screenWidth * 0.88,
                height: screenHeight / 16.5,
                textStyle: TextStyle(
                  color: ColorManager.whiteColor,
                  fontSize: screenHeight * 0.02,
                ),
                hasIcon: false,
              );
            } else if (state is LoadingStateReservation) {
              return const Indicator();
            } else if (state is FailureStateReservation) {
              return SizedBox(
                height: screenHeight / 3,
                child: Column(
                  children: [
                    AppButton(
                      text: StringsManager.REGISTER,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ReservationModel reservation = ReservationModel(
                              bicycleId: bicycle.id,
                              fromHubId: hubId.id,
                              toHubId: hubIdto.id,
                              duration: 0,
                              startTime: "2024-08-09T15:44:48.928Z",
                              endTime: "2024-08-09T15:44:48.928Z",
                              reservationStatus: "NEW",
                              paymentMethod: "Wallet");
                          context.read<ReservationBloc>().add(
                                ReservationEvent(reservation),
                              );
                        }
                      },
                      backgroundColor: ColorManager.primaryColor,
                      width: screenWidth * 0.88,
                      height: screenHeight / 16.5,
                      textStyle: TextStyle(
                        color: ColorManager.whiteColor,
                        fontSize: screenHeight * 0.02,
                      ),
                      hasIcon: false,
                    ),
                    Text(
                      state.message,
                      style: const TextStyle(fontSize: 20, color: Colors.red),
                    )
                  ],
                ),
              );
            } else {
              return const SuccessWidget();
            }
          },
        ),
      ),
    ]);
  }
}

Widget buildSizeBox(double screenHeight) {
  return SizedBox(height: screenHeight * 0.02);
}

Widget buildSizeBox2(double screenHeight) {
  return SizedBox(height: screenHeight * 0.05);
}

Widget buildText() {
  return Text(
    StringsManager.SELECTPAYMENTMETHOD,
    style: StylesManager.headLineStyle,
  );
}

Widget buildAppButton() {
  return SizedBox(
    width: double.infinity,
    child: AppButton(
      text: StringsManager.CONFIRM,
      onPressed: wiee,
      backgroundColor: ColorManager.primaryColor,
      width: screenWidth * 0.88,
      height: screenHeight / 15,
      textStyle: StylesManager.greenButtonStyle,
      hasIcon: false,
    ),
  );
}

void onAppBarPressed(context) {
  Navigator.of(context).pop();
}

wiee() {}
