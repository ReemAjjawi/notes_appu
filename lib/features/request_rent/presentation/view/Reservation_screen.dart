import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
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

  final TextEditingController durationController = TextEditingController();
  final TextEditingController timestartController = TextEditingController();

  final TextEditingController timeendController = TextEditingController();

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
              onPressed: () => _onAppBarPressed(context),
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
      _buildSizeBox2(screenHeight / 14),
      Stack(
        children: [
          Column(
            children: [
              CustomListTile(
                leading: const Icon(
                  Icons.location_on,
                  color: ColorManager.cancelColor,
                ),
                title: Text(StringsManager.CURRENTLOCATION,
                    style: StylesManager.titleTextStyle),
                subtitle: Text(hubId.name, style: StylesManager.subTitleStyle),
                backgroundColor: ColorManager.whiteColor,
                borderColor: ColorManager.whiteColor,
                height: screenHeight * 0.1,
                width: screenWidth,
                hasrawtitle: false,
                hasrawsubtitle: false,
                hascolum: false,
              ),
              CustomListTile(
                leading: const Icon(
                  Icons.location_on,
                  color: Colors.blue,
                ),
                title: Text(StringsManager.OFFICE,
                    style: StylesManager.titleTextStyle),
                subtitle:
                    Text(hubIdto.name, style: StylesManager.subTitleStyle),
                backgroundColor: ColorManager.whiteColor,
                borderColor: ColorManager.whiteColor,
                height: screenHeight * 0.1,
                width: screenWidth,
                hasrawtitle: false,
                hasrawsubtitle: false,
                hascolum: false,
              ),
            ],
          ),
          Positioned(
            left: screenWidth - (screenWidth - 29),
            top: screenHeight * 0.1 / 2,
            child: Dash(
              direction: Axis.vertical,
              length: screenHeight * 0.1,
              dashLength: 4,
              dashColor: Colors.grey,
            ),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: CustomListTile(
          title: Text(bicycle.type, style: StylesManager.titleTextStyle),
          subtitle: Icon(Icons.star, color: ColorManager.starColor),
          subtitle2: Text(
            StringsManager.REVIEWS,
            style: StylesManager.subTitleStyle,
          ),
          trailing: Image.asset(
            AssetsManager.bmwRedImage,
            height: screenHeight * 0.25,
            fit: BoxFit.cover,
          ),
          backgroundColor: ColorManager.scondaryColor,
          borderColor: ColorManager.borderColor,
          height: screenHeight * 0.1,
          width: screenWidth,
          hasrawtitle: false,
          hasrawsubtitle: true,
          hascolum: false,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: CustomTextFormField(
          controller: durationController,
          hintText: StringsManager.TIME,
          colorborder: ColorManager.hintTextColor,
          width: screenWidth,
          height: screenHeight / 15,
        ),
      ),
      Container(
        width: screenWidth,
        height: screenHeight / 13,
        child: Builder(builder: (context) {
          return TextFormField(
            controller: timestartController,
            decoration: InputDecoration(
              hintText: 'Enter start time',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02,
                horizontal: screenWidth,
              ),
              errorMaxLines: 1,
              errorStyle: TextStyle(height: 0.5),
              suffixIcon: Icon(Icons.access_time),
            ),
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (pickedTime != null) {
                final now = DateTime.now();
                final formattedTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  pickedTime.hour,
                  pickedTime.minute,
                );
                timestartController.text =
                    "${formattedTime.toLocal()}".split(' ')[1].substring(0, 5);
                print(timestartController.text);
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter start time';
              }
              return null;
            },
          );
        }),
      ),
      _buildText(),
      _buildSizeBox(screenHeight),
      buildListView(screenHeight, screenWidth),
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
                        duration: int.parse(durationController.text),
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

Widget _buildSizeBox(double screenHeight) {
  return SizedBox(height: screenHeight * 0.02);
}

Widget _buildSizeBox2(double screenHeight) {
  return SizedBox(height: screenHeight * 0.05);
}

Widget _buildText() {
  return Text(
    StringsManager.SELECTPAYMENTMETHOD,
    style: StylesManager.headLineStyle,
  );
}

Widget _buildAppButton() {
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

void _onAppBarPressed(context) {
  Navigator.of(context).pop();
}

wiee() {}
